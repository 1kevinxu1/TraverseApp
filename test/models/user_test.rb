# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_digest  :string           not null
#  fname           :string           not null
#  lname           :string           not null
#  birthday        :date             not null
#  image_url       :string
#  about_blurb     :text
#  story_blurb     :text
#  travel_blurb    :text
#  city            :string           not null
#  state           :string           not null
#  longitude       :float            not null
#  latitude        :float            not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
