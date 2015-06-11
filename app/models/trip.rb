# == Schema Information
#
# Table name: trips
#
#  id            :integer          not null, primary key
#  owner_id      :string           not null
#  from_city_zip :string           not null
#  to_city_zip   :string           not null
#  start_date    :date             not null
#  end_date      :date             not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Trip < ActiveRecord::Base
  validates :owner_id, :start_date, :end_date, presence: true
  validate(
    :must_be_traveling,
    :dates_are_reasonable,
    :no_overlapping_trips,
    :city_zips_exist
  )

  belongs_to :user, class_name: 'User', foreign_key: :owner_id
  belongs_to :from_city, class_name: 'City', foreign_key: :from_city_zip, primary_key: :zip
  belongs_to :to_city, class_name: 'City', foreign_key: :to_city_zip, primary_key: :zip


  def overlapping_trips(array_of_trips)
    conflicting_trips = []
    array_of_trips.each do |trip|
      if start_date >= trip.start_date && start_date < trip.end_date
        conflicting_trips << trip
      end
    end
    conflicting_trips
  end

  def from_city=(city)
    city = city.split.map { |i| i.capitalize }.join(' ')
    city = City.find_by(city: city)
    self.from_city_zip = city && city.zip
  end

  def to_city=(city)
    city = city.split.map { |i| i.capitalize }.join(' ')
    city = City.find_by(city: city)
    self.to_city_zip = city && city.zip
  end

  def start_date_string
    self.start_date.strftime('%m/%d/%Y')
  end

  def end_date_string
    self.end_date.strftime('%m/%d/%Y')
  end

  private

  def must_be_traveling
    if self.from_city && self.to_city && self.from_city === self.to_city
      errors.add("You must actually travel to make a trip.")
    end
  end

  def dates_are_reasonable
    if end_date.yday - start_date.yday < 0
      errors.add("You can't take a trip back time. Yet.")
    end
  end

  def no_overlapping_trips
    if !overlapping_trips(user.trips).empty?
      errors.add("You're already someplace else, man!")
    end
  end

  def city_zips_exist
    errors.add("You can't travel from that city.") unless self.from_city
    errors.add("You can't travel to that city.") unless self.to_city
  end
end
