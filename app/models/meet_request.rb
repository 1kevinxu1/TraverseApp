# == Schema Information
#
# Table name: meet_requests
#
#  id                :integer          not null, primary key
#  requester_id      :integer          not null
#  requested_trip_id :integer          not null
#  status            :string           not null
#

class MeetRequest < ActiveRecord::Base
  validates :requester, :requested_trip, :status, presence: true
  validates :status, inclusion: {
    in: ['PENDING', 'DECLINED', 'ACCEPTED'],
    message: "Status is not a valid status"
  }
  validate :cant_request_own_trip
  belongs_to :requester, class_name: 'User'
  belongs_to :requested_trip, class_name: 'Trip'

  # after_initialize :set_status

  private

  def cant_request_own_trip
    if requester.trips.include?(requested_trip)
      errors.add("You can't request your own trip")
    end
  end
end
