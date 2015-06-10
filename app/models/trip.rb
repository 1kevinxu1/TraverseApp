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
  validates :owner_id

end
