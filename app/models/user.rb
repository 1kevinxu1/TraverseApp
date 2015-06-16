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
#  hometown_id     :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  validates :email, :password_digest, :session_digest, :fname, :lname, :birthday, presence: true
  validates :age, numericality: { greater_than_or_equal_to: 18 }
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :email, :session_digest, uniqueness: true
  has_many :trips, class_name: 'Trip', foreign_key: :owner_id, dependent: :destroy
  has_many :meet_requests, foreign_key: :requester_id, dependent: :destroy
  has_many :requested_trips, through: :meet_requests, source: :requested_trip
  belongs_to :hometown, class_name: 'City', foreign_key: :hometown_id, primary_key: :zip

  after_initialize :ensure_session_digest
  geocoded_by :address
  before_validation :geocode


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

  def address
      [city, state, zipcode, country].compact.join(', ')
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

  def ensure_session_digest
    self.session_digest ||= User.generate_session_digest
  end

end
