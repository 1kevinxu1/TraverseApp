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

require 'test_helper'

class TripTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
