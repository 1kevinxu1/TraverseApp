class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id, null: false
      t.integer :hometown_id, null: false
      t.text :about_blurb
      t.text :story_blurb
      t.text :travel_blurb
      t.string :image_url, null: false
      t.timestamps null: false
    end

    add_index :profiles, :hometown_id
    add_index :profiles, :user_id, unique: true
  end
end
