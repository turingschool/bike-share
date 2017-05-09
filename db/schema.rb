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

ActiveRecord::Schema.define(version: 20170509210226) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boardgame_categories", force: :cascade do |t|
    t.integer "boardgames_id"
    t.integer "categories_id"
    t.index ["boardgames_id"], name: "index_boardgame_categories_on_boardgames_id", using: :btree
    t.index ["categories_id"], name: "index_boardgame_categories_on_categories_id", using: :btree
  end

  create_table "boardgame_users", force: :cascade do |t|
    t.integer "boardgames_id"
    t.integer "users_id"
    t.index ["boardgames_id"], name: "index_boardgame_users_on_boardgames_id", using: :btree
    t.index ["users_id"], name: "index_boardgame_users_on_users_id", using: :btree
  end

  create_table "boardgames", force: :cascade do |t|
    t.text    "name",        null: false
    t.text    "description", null: false
    t.integer "year",        null: false
    t.integer "user_id",     null: false
    t.integer "category_id", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.text "name", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.text "name", null: false
  end

  create_table "conditions", force: :cascade do |t|
    t.date    "date",            null: false
    t.float   "max_temp",        null: false
    t.float   "mean_temp",       null: false
    t.float   "min_temp",        null: false
    t.float   "mean_humidity",   null: false
    t.float   "mean_visibility", null: false
    t.float   "mean_wind_speed", null: false
    t.float   "precipitation",   null: false
    t.integer "zipcode_id"
  end

  create_table "stations", force: :cascade do |t|
    t.text    "name",              null: false
    t.integer "dock_count",        null: false
    t.integer "city_id",           null: false
    t.date    "installation_date", null: false
    t.decimal "longitude",         null: false
    t.decimal "latitude",          null: false
  end

  create_table "trips", force: :cascade do |t|
    t.integer  "duration",          null: false
    t.datetime "start_date",        null: false
    t.integer  "start_station_id",  null: false
    t.datetime "end_date",          null: false
    t.integer  "end_station_id",    null: false
    t.integer  "bike_id",           null: false
    t.text     "subscription_type", null: false
    t.integer  "zipcode_id"
  end

  create_table "users", force: :cascade do |t|
    t.text "first_name", null: false
    t.text "last_name",  null: false
  end

  create_table "zipcodes", force: :cascade do |t|
    t.text "zipcode", null: false
  end

end
