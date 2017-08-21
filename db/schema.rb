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

ActiveRecord::Schema.define(version: 20170820235406) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "end_dates", force: :cascade do |t|
    t.date "date"
  end

  create_table "start_dates", force: :cascade do |t|
    t.date "date"
  end

  create_table "subscription_types", force: :cascade do |t|
    t.string "subscription_type"
  end

  create_table "trips", force: :cascade do |t|
    t.integer "duration"
    t.integer "start_station"
    t.integer "end_station"
    t.integer "bike_id"
    t.integer "subscription_type_id"
    t.integer "zip_code_id"
    t.integer "start_date_id"
    t.integer "end_date_id"
  end

  create_table "zip_codes", force: :cascade do |t|
    t.integer "zip_code"
  end

  create_table "cities", force: :cascade do |t|
    t.string "city"
  end

  create_table "stations", force: :cascade do |t|
    t.string "name"
    t.integer "dock_count"
    t.date "installation_date"
    t.integer "city_id"
  end

end
