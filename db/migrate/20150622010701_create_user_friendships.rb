class CreateUserFriendships < ActiveRecord::Migration
  def change
    create_table :user_friendships do |t|
      t.integer :from_user_id, null: false
      t.integer :to_user_id, null: false
      t.timestamps null: false
    end
    add_index :user_friendships, :from_user_id
    add_index :user_friendships, :to_user_id
  end
end
