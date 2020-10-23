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

ActiveRecord::Schema.define(version: 2020_10_23_155236) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "amusement_parks", force: :cascade do |t|
    t.string "name"
    t.string "admission"
  end

  create_table "mechanics", force: :cascade do |t|
    t.string "name"
    t.integer "experience"
  end

  create_table "park_rides", force: :cascade do |t|
    t.string "name"
    t.integer "thrill_rating"
    t.bigint "amusement_park_id"
    t.index ["amusement_park_id"], name: "index_park_rides_on_amusement_park_id"
  end

  add_foreign_key "park_rides", "amusement_parks"
end
