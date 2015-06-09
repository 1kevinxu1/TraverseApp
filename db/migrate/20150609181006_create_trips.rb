class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :owner_id, null: false
      t.string :from_city_zip, null: false
      t.string :to_city_zip, null: false
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.timestamps null: false
    end

    add_index :trips, :owner_id
    add_index :trips, :from_city_zip
    add_index :trips, :to_city_zip
    add_index :trips, :start_date
    add_index :trips, :end_date
  end
end
