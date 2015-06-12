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
  belongs_to :hometown, class_name: 'City', foreign_key: :hometown_id, primary_key: :zip

  def hometown=(hometown)
    hometown = hometown.split.map { |i| i.capitalize }.join(' ')
    hometown = City.find_by(city: hometown)
    self.hometown_id = hometown && hometown.zip
  end

end
