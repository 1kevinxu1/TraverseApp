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

require 'test_helper'

class TripTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
