class MeetRequest < ActiveRecord::Base
  validates :requester, :requested_trip, :status, presence: true
  validates :status, inclusion: { in: ['PENDING', 'DECLINED', 'ACCEPTED'],
                                  message: "Status is not a valid status"}
  validate :cant_request_own_trip
  belongs_to :requester, class_name: 'User'
  belongs_to :requested_trip, class_name: 'Trip'

  after_initialize :set_default_status

  def set_default_status
    self.status = 'PENDING'
  end

  def accept
    self.status = 'ACCEPTED'
  end

  def decline
    self.status = 'DECLINE'
  end
end

private

def cant_request_own_trip
  if requester.trips.include?(requested_trip)
    errors.add("You can't request your own trip")
  end
end
