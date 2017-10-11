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

ActiveRecord::Schema.define(version: 20171010212538) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conditions", force: :cascade do |t|
    t.date "date"
    t.integer "max_temperature_f"
    t.integer "min_temperature_f"
    t.integer "mean_temperature_f"
    t.integer "mean_humidity"
    t.integer "mean_visibility_miles"
    t.integer "mean_wind_speed_mph"
    t.float "precipitation_inches"
    t.integer "zip_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stations", force: :cascade do |t|
    t.text "name"
    t.integer "dock_count"
    t.text "city"
    t.date "installation_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "long"
    t.float "lat"
  end

  create_table "trips", force: :cascade do |t|
    t.bigint "duration"
    t.date "start_date"
    t.string "start_station_name"
    t.bigint "start_station_id"
    t.date "end_date"
    t.string "end_station_name"
    t.bigint "end_station_id"
    t.bigint "bike_id"
    t.string "subscription_type"
    t.bigint "zip_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
