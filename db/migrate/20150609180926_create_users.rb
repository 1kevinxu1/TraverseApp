class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :session_digest, null: false
      t.string :fname, null: false
      t.string :lname, null: false
      t.date :birthday, null: false
      t.string :image_url
      t.text :about_blurb
      t.text :story_blurb
      t.text :travel_blurb
      t.string :city, null: false
      t.string :state
      t.string :country, null: false
      t.float :longitude, null: false
      t.float :latitude, null: false
      t.timestamps null: false
    end

    add_index :users, :email, unique: true
    add_index :users, :password_digest
    add_index :users, :session_digest, unique: true
    add_index :users, :fname
    add_index :users, :lname
    add_index :users, :birthday
    add_index :users, :image_url
    add_index :users, :city
    add_index :users, :country
    add_index :users, :longitude
    add_index :users, :latitude
  end
end
