class UserInterest < ActiveRecord::Base
  validates :user, :interest_id,  presence: true
  belongs_to :user
  belongs_to :interest

  after_initialize :ensure_interest_exists

  def ensure_interest_exists
    # Interest.find
  end
end
