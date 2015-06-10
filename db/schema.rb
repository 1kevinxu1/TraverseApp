# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150610214539) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", id: false, force: :cascade do |t|
    t.integer "zip"
    t.string  "state", limit: 2
    t.string  "city",  limit: 16
    t.decimal "lat",              precision: 8,  scale: 6
    t.decimal "lng",              precision: 10, scale: 6
  end

  create_table "meet_requests", force: :cascade do |t|
    t.integer "requester_id",      null: false
    t.integer "requested_trip_id", null: false
    t.string  "status",            null: false
  end

  add_index "meet_requests", ["requested_trip_id"], name: "index_meet_requests_on_requested_trip_id", using: :btree
  add_index "meet_requests", ["requester_id"], name: "index_meet_requests_on_requester_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id",      null: false
    t.integer  "hometown_id",  null: false
    t.text     "about_blurb"
    t.text     "story_blurb"
    t.text     "travel_blurb"
    t.string   "image_url",    null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "profiles", ["hometown_id"], name: "index_profiles_on_hometown_id", using: :btree
  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", unique: true, using: :btree

  create_table "trips", force: :cascade do |t|
    t.string   "owner_id",      null: false
    t.string   "from_city_zip", null: false
    t.string   "to_city_zip",   null: false
    t.date     "start_date",    null: false
    t.date     "end_date",      null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "trips", ["end_date"], name: "index_trips_on_end_date", using: :btree
  add_index "trips", ["from_city_zip"], name: "index_trips_on_from_city_zip", using: :btree
  add_index "trips", ["owner_id"], name: "index_trips_on_owner_id", using: :btree
  add_index "trips", ["start_date"], name: "index_trips_on_start_date", using: :btree
  add_index "trips", ["to_city_zip"], name: "index_trips_on_to_city_zip", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "session_digest",  null: false
    t.string   "fname",           null: false
    t.string   "lname",           null: false
    t.date     "birthday",        null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["birthday"], name: "index_users_on_birthday", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["fname"], name: "index_users_on_fname", using: :btree
  add_index "users", ["lname"], name: "index_users_on_lname", using: :btree
  add_index "users", ["password_digest"], name: "index_users_on_password_digest", using: :btree
  add_index "users", ["session_digest"], name: "index_users_on_session_digest", unique: true, using: :btree

end
