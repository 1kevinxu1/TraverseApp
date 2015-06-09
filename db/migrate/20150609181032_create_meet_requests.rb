class CreateMeetRequests < ActiveRecord::Migration
  def change
    create_table :meet_requests do |t|
      t.integer :requester_id, null: false
      t.integer :requested_trip_id, null: false
      t.string :status, null: false
    end

    add_index :meet_requests, :requester_id
    add_index :meet_requests, :requested_trip_id
  end
end
