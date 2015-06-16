# == Schema Information
#
# Table name: trips
#
#  id         :integer          not null, primary key
#  owner_id   :integer          not null
#  city_zip   :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Trip < ActiveRecord::Base
  validates :owner_id, :start_date, :end_date, presence: true
  validate(
    :dates_are_reasonable,
    :no_overlapping_dates,
  )

  belongs_to :user, class_name: 'User', foreign_key: :owner_id
  belongs_to :city, class_name: 'City', foreign_key: :city_zip, primary_key: :zip
  has_many :meet_requests, class_name: 'MeetRequest', foreign_key: :requested_trip_id
  has_many :requesters, through: :meet_requests, source: :requester

  geocoded_by :address
  before_validation :geocode

  def address
      [city, state, zipcode, country].compact.join(', ')
  end

  def start_date_string
    self.start_date.strftime('%m/%d/%Y')
  end

  def end_date_string
    self.end_date.strftime('%m/%d/%Y')
  end

  def pending_requests
    meet_requests.where(status: 'PENDING')
  end

  def accepted_requests
    meet_requests.where(status: 'ACCEPTED')
  end

  def overlapping_trips(search_all, search_user = self.owner_id)
    #Use LIMIT/OFFSET later for infinite search results
    Trip.find_by_sql([<<-SQL, {sd: start_date, ed: end_date, su: search_user, sa: search_all, cz: city_zip, id: self.id}])
      SELECT
        *
      FROM
        trips
      WHERE
        ((trips.start_date > :sd AND trips.start_date < :ed) OR
        (trips.end_date > :sd AND trips.end_date < :ed) OR
        (trips.start_date <= :sd AND trips.end_date >= :ed) OR
        (trips.start_date >= :sd AND trips.end_date <= :ed)) AND
        (trips.city_zip = :cz) AND
        (trips.id != :id) AND
        (:sa OR trips.owner_id = :su)
    SQL
  end

  private

  def dates_are_reasonable
    if end_date - start_date < 0 && start_date >= Date.today
      errors.add("You can't take a trip back time. Yet.")
    end
  end

  def no_overlapping_dates
    #Use LIMIT/OFFSET later for infinite search results
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
      errors.add("You're already someplace else, man!")
    end
  end
end
