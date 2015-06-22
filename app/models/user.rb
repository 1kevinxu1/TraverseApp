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
#  state           :string
#  country         :string           not null
#  longitude       :float            not null
#  latitude        :float            not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  validates(
    :email,
    :password_digest,
    :session_digest,
    :fname,
    :lname,
    :birthday,
    :city,
    :country,
    :longitude,
    :latitude,
    presence: true
  )
  validates :age, numericality: { greater_than_or_equal_to: 18 }
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :email, :session_digest, uniqueness: true
  has_many :trips, class_name: 'Trip', foreign_key: :owner_id, dependent: :destroy
  has_many :meet_requests, foreign_key: :requester_id, dependent: :destroy
  has_many :requested_trips, through: :meet_requests, source: :requested_trip
  has_many :user_interests, dependent: :destroy
  has_many :interests, through: :user_interests
  has_many :user_friendships, foreign_key: :from_user_id
  has_many :friends, through: :user_friendships, source: :to_user

  after_initialize :ensure_session_digest, :ensure_profile_picture

  attr_accessor :password

  def self.find_by_credentials(email, password)
    user = User.find_by_email(email)
    user && user.is_password?(password) ? user : nil
  end

  def self.generate_session_digest
    token = SecureRandom::urlsafe_base64
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def name
    self.fname.capitalize + " " + self.lname.capitalize
  end

  def age
    return 0 unless self.birthday
    today = Date.today
    age = today.year - self.birthday.year
    age -= 1 if today.yday < self.birthday.yday
    age
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_session_digest
    self.session_digest = User.generate_session_digest
    self.save!
    self.session_digest
  end

  def ensure_profile_picture
    self.image_url ||= Faker::Avatar.image
    self.save!
    self.image_url
  end

  def ensure_session_digest
    self.session_digest ||= User.generate_session_digest
  end
end
