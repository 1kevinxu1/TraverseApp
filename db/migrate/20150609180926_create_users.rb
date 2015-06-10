class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :session_digest, null: false
      t.string :fname, null: false
      t.string :lname, null: false
      t.date :birthday, null: false
      t.timestamps null: false
    end

    add_index :users, :email, unique: true
    add_index :users, :password_digest
    add_index :users, :session_digest, unique: true
    add_index :users, :fname
    add_index :users, :lname
    add_index :users, :birthday
  end
end
