# == Schema Information
#
# Table name: profiles
#
#  id           :integer          not null, primary key
#  user_id      :integer          not null
#  fname        :string           not null
#  lname        :string           not null
#  birthday     :date             not null
#  hometown_id  :integer          not null
#  about_blurb  :text
#  story_blurb  :text
#  travel_blurb :text
#  image_url    :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
