class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.integer :owner_id, null: false
      t.integer :city_zip, null: false
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.timestamps null: false
    end

    add_index :trips, :owner_id
    add_index :trips, :city_zip
    add_index :trips, :start_date
    add_index :trips, :end_date
  end
end
