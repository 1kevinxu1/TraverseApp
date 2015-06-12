# == Schema Information
#
# Table name: trips
#
#  id         :integer          not null, primary key
#  owner_id   :string           not null
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
    :no_overlapping_trips,
    :city_zip_exists
  )

  belongs_to :user, class_name: 'User', foreign_key: :owner_id
  belongs_to :city, class_name: 'City', foreign_key: :city_zip, primary_key: :zip

  def city=(city)
    city = city.split.map { |i| i.capitalize }.join(' ')
    city = City.find_by(city: city)
    self.city_zip = city && city.zip
  end

  def start_date_string
    self.start_date.strftime('%m/%d/%Y')
  end

  def end_date_string
    self.end_date.strftime('%m/%d/%Y')
  end

  def overlapping_trips(search_all, search_user = self.owner_id)

    Trip.find_by_sql([<<-SQL, {sd: start_date, ed: end_date, su: search_user, sa: search_all}])
      SELECT
        *
      FROM
        trips
      WHERE
        (trips.start_date > :sd AND trips.start_date < :ed OR
        trips.end_date > :sd AND trips.end_date < :ed OR
        (trips.start_date < :sd AND trips.end_date > :ed)) AND
        (:sa OR trips.owner_id = :su)
    SQL
  end

  private

  def dates_are_reasonable
    if end_date - start_date < 0 && start_date >= Date.today
      errors.add("You can't take a trip back time. Yet.")
    end
  end

  def no_overlapping_trips
    if !overlapping_trips(false).empty?
      errors.add("You're already someplace else, man!")
    end
  end

  def city_zip_exists
    errors.add(city_zip, "is not a real city.") unless self.city
  end
end
