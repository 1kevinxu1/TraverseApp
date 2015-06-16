class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.integer :owner_id, null: false
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :country, null: false
      t.integer :zipcode, null: false
      t.float :longitude, null: false
      t.float :latitude, null: false
      t.timestamps null: false
    end

    add_index :trips, :owner_id
    add_index :trips, :start_date
    add_index :trips, :end_date
    add_index :trips, :city
  end
end
