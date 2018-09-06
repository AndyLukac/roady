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

ActiveRecord::Schema.define(version: 2018_09_05_123908) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "friends", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "journey_id"
    t.index ["journey_id"], name: "index_friends_on_journey_id"
    t.index ["user_id"], name: "index_friends_on_user_id"
  end

  create_table "journey_items", force: :cascade do |t|
    t.string "name"
    t.string "owner"
    t.string "address"
    t.integer "guests"
    t.integer "price"
    t.string "flight_number"
    t.string "reservation_number"
    t.string "departure_place"
    t.string "arrival_place"
    t.integer "hiring_days"
    t.string "brand"
    t.string "type"
    t.bigint "journey_id"
    t.float "departure_longitude"
    t.float "departure_latitude"
    t.float "arrival_longitude"
    t.float "arrival_latitude"
    t.float "latitude"
    t.float "longitude"
    t.datetime "arrival_date"
    t.datetime "departure_date"
    t.string "image"
    t.string "check_in"
    t.string "check_out"
    t.string "telephone"
    t.index ["journey_id"], name: "index_journey_items_on_journey_id"
  end

  create_table "journeys", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.string "photo"
    t.date "start_date"
    t.date "end_date"
    t.index ["user_id"], name: "index_journeys_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "journey_id"
    t.boolean "read", default: false
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["journey_id"], name: "index_notifications_on_journey_id"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "friends", "journeys"
  add_foreign_key "friends", "users"
  add_foreign_key "journey_items", "journeys"
  add_foreign_key "journeys", "users"
  add_foreign_key "notifications", "journeys"
  add_foreign_key "notifications", "users"
end
