# == Schema Information
#
# Table name: profiles
#
#  id           :integer          not null, primary key
#  user_id      :integer          not null
#  hometown_id  :integer          not null
#  about_blurb  :text
#  story_blurb  :text
#  travel_blurb :text
#  image_url    :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Profile < ActiveRecord::Base
  validates :user, :hometown_id, :image_url, presence: true
  belongs_to :user
  # belongs_to :hometown, class_name: 'City'

  #TEMPORARY FIX UNTIL CITY DATABASE IS INTEGRATED AND GRAVATAR IMPLEMENTED
  after_initialize :hometown, :image
  def hometown
    self.hometown_id = 1
    return "San Diego, CA"
  end

  def image
    self.image_url = "send help"
  end

end
