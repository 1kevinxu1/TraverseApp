class UserFriendship < ActiveRecord::Base
  validates :from_user, :to_user, presence: true
  belongs_to :from_user, class_name: 'User'
  belongs_to :to_user, class_name: 'User'
end
