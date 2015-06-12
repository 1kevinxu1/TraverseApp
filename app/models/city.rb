# == Schema Information
#
# Table name: cities
#
#  zip   :integer
#  state :string(2)
#  city  :string(16)
#  lat   :decimal(8, 6)
#  lng   :decimal(10, 6)
#

class City < ActiveRecord::Base
  has_many :trips, class_name: 'Trip', foreign_key: :city_zip, primary_key: :zip
  has_many :users, class_name: 'User', foreign_key: :hometown_id, primary_key: :zip
end
