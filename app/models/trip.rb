# == Schema Information
#
# Table name: trips
#
#  id         :integer          not null, primary key
#  owner_id   :integer          not null
#  name       :string           not null
#  start_date :date             not null
#  end_date   :date             not null
#  city       :string           not null
#  state      :string
#  country    :string           not null
#  longitude  :float            not null
#  latitude   :float            not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Trip < ActiveRecord::Base
  validates(
    :owner_id,
    :start_date,
    :end_date,
    :name,
    :country,
    presence: true
    )
  validate :dates_are_reasonable, :no_overlapping_dates
  validate :real_location

  belongs_to :user, class_name: 'User', foreign_key: :owner_id
  has_many(
    :meet_requests,
    class_name: 'MeetRequest',
    foreign_key: :requested_trip_id,
    dependent: :destroy
  )
  has_many :requesters, through: :meet_requests, source: :requester

  geocoded_by :address
  after_validation :geocode

  attr_accessor :address

  def start_date_string
    self.start_date.strftime("%B %d, %Y")
  end

  def end_date_string
    self.end_date.strftime("%B %d, %Y")
  end

  def pending_requests
    meet_requests.where(status: 'PENDING')
  end

  def accepted_requests
    meet_requests.where(status: 'ACCEPTED')
  end

  def overlapping_trips(distance, search_all, search_user = self.owner_id)
    #Use LIMIT/OFFSET later for infinite search results
    sql_params = {
      sd: start_date,
      ed: end_date,
      su: search_user,
      sa: search_all,
      city: city,
      state: state,
      id: id
    }

    self.nearbys(distance).where(
       "((trips.start_date > :sd AND trips.start_date < :ed) OR
        (trips.end_date > :sd AND trips.end_date < :ed) OR
        (trips.start_date <= :sd AND trips.end_date >= :ed) OR
        (trips.start_date >= :sd AND trips.end_date <= :ed)) AND
        (:sa OR trips.owner_id = :su)", sql_params)
  end

  private

  def dates_are_reasonable
    if start_date && end_date
      if end_date - start_date < 0 || start_date < Date.today
        errors.add(:date_range, "is not valid")
      end
    end
  end

  def no_overlapping_dates
    trips = Trip.find_by_sql([<<-SQL, {sd: start_date, ed: end_date, su: self.owner_id}])
      SELECT
        *
      FROM
        trips
      WHERE
        ((trips.start_date > :sd AND trips.start_date < :ed) OR
        (trips.end_date > :sd AND trips.end_date < :ed) OR
        (trips.start_date <= :sd AND trips.end_date >= :ed) OR
        (trips.start_date > :sd AND trips.end_date < :ed)) AND
        (trips.owner_id = :su)
    SQL
    if !trips.empty?
      errors.add(:date_range, "can't conflict with other trips")
    end
  end

  def real_location
    unless city != "" && latitude && longitude
      errors.add(:please, "list a city as your destination")
    end
  end
end
