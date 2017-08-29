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

ActiveRecord::Schema.define(version: 20170823202801) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string "city"
  end

  create_table "stations", force: :cascade do |t|
    t.string "name"
    t.integer "dock_count"
    t.date "installation_date"
    t.integer "city_id"
    t.float "lat"
    t.float "long"
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
    t.date "trip_date"
  end

  create_table "weathers", force: :cascade do |t|
    t.date "date"
    t.float "max_temperature"
    t.float "mean_temperature"
    t.float "min_temperature"
    t.float "mean_humidity"
    t.float "mean_visibility"
    t.float "mean_wind_speed"
    t.float "precipitation"
  end

  create_table "zip_codes", force: :cascade do |t|
    t.integer "zip_code"
  end

end
