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

ActiveRecord::Schema.define(version: 20170321213351) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bikes", force: :cascade do |t|
    t.integer "bike_number"
  end

  create_table "cities", force: :cascade do |t|
    t.text "name"
  end

  create_table "conditions", force: :cascade do |t|
    t.date    "date"
    t.integer "max_temperature_f"
    t.integer "mean_temperature_f"
    t.integer "min_temperature_f"
    t.integer "mean_humidity"
    t.integer "mean_visibility_miles"
    t.integer "mean_wind_speed_mph"
    t.integer "precipitation_inches"
    t.integer "zip_code"
  end

  create_table "stations", force: :cascade do |t|
    t.text    "name"
    t.integer "dock_count"
    t.date    "installation_date"
    t.integer "city_id"
    t.decimal "lat",               precision: 10, scale: 6
    t.decimal "long",              precision: 10, scale: 6
  end

  create_table "subscription_types", force: :cascade do |t|
    t.text "flavor"
  end

  create_table "trips", force: :cascade do |t|
    t.integer "duration"
    t.date    "start_date"
    t.integer "start_station_id"
    t.date    "end_date"
    t.integer "end_station_id"
    t.integer "bike_id"
    t.text    "subscription_type_id"
    t.integer "zip_code"
  end

end
