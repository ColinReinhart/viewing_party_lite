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

ActiveRecord::Schema.define(version: 2022_07_18_185422) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "parties", force: :cascade do |t|
    t.integer "movie_id"
    t.integer "duration"
    t.date "date"
    t.time "start_time"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "movie_name"
    t.index ["user_id"], name: "index_parties_on_user_id"
  end

  create_table "party_users", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "party_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["party_id"], name: "index_party_users_on_party_id"
    t.index ["user_id"], name: "index_party_users_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  add_foreign_key "parties", "users"
  add_foreign_key "party_users", "parties"
  add_foreign_key "party_users", "users"
end
