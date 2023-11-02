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

ActiveRecord::Schema.define(version: 20231031143343) do

  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.text   "description"
    t.string "url"
  end

  create_table "destinations", force: :cascade do |t|
    t.string "name"
    t.string "address"
  end

  create_table "trip_activities", force: :cascade do |t|
    t.integer "trip_id"
    t.integer "activity_id"
  end

  add_index "trip_activities", ["activity_id"], name: "index_trip_activities_on_activity_id"
  add_index "trip_activities", ["trip_id"], name: "index_trip_activities_on_trip_id"

  create_table "trips", force: :cascade do |t|
    t.string  "name"
    t.integer "duration"
  end

end
