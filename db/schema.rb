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

ActiveRecord::Schema.define(version: 20170303060839) do

  create_table "friendships", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "friend_user_id"
    t.index ["friend_user_id", "user_id"], name: "index_friendships_on_friend_user_id_and_user_id", unique: true
    t.index ["user_id", "friend_user_id"], name: "index_friendships_on_user_id_and_friend_user_id", unique: true
  end

  create_table "requests_from", id: false, force: :cascade do |t|
    t.integer "from_user_id"
    t.integer "to_user_id"
    t.index ["from_user_id", "to_user_id"], name: "index_requests_from_on_from_user_id_and_to_user_id", unique: true
    t.index ["to_user_id", "from_user_id"], name: "index_requests_from_on_to_user_id_and_from_user_id", unique: true
  end

  create_table "requests_to", force: :cascade do |t|
    t.integer "from_user_id"
    t.integer "to_user_id"
  end

  create_table "responses", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "age_early_20s"
    t.string   "age_late_20s"
    t.string   "age_30s"
    t.string   "age_40s_older"
    t.string   "gender"
    t.string   "budget_min"
    t.string   "budget_max"
    t.string   "move_in_date"
    t.string   "duration"
    t.string   "pet_dog"
    t.string   "pet_cat"
    t.string   "pet_other"
    t.string   "like_pet_dog"
    t.string   "like_pet_cat"
    t.string   "like_pet_other"
    t.string   "wakeup"
    t.string   "bedtime"
    t.string   "work"
    t.string   "work_from_home"
    t.string   "overnight_guests"
    t.string   "relationship"
    t.string   "relationship_type"
    t.string   "smoking"
    t.string   "messy"
    t.string   "environment"
    t.string   "party"
    t.string   "communicator"
    t.string   "friends_over"
    t.string   "drink"
    t.string   "visitors"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["user_id"], name: "index_responses_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
