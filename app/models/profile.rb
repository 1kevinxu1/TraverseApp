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

class Profile < ActiveRecord::Base
  validates :user, :fname, :lname, :age, :hometown_id, :image_url, presence: true
  belongs_to :user
  # belongs_to :hometown, class_name: 'City'

  #TEMPORARY FIX UNTIL CITY DATABASE IS INTEGRATED AND GRAVATAR IMPLEMENTED
  after_initialize :hometown
  def hometown
    self.hometown_id = 1
  end

  def image_url
    self.image_url = "send help"
  end

  def name
    self.fname + " " + self.lname
  end

  def age
    today = Date.today
    age = today.year - self.birthday.year
    age -= 1 if now.yday < self.birthday.yday
    age
  end
end
