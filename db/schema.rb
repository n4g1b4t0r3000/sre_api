# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2025_01_04_233448) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spot15m_candles", force: :cascade do |t|
    t.datetime "open_time"
    t.decimal "open", precision: 15, scale: 8
    t.decimal "high", precision: 15, scale: 8
    t.decimal "low", precision: 15, scale: 8
    t.decimal "close", precision: 15, scale: 8
    t.decimal "volume", precision: 25, scale: 8
    t.decimal "avg_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spot1d_candles", force: :cascade do |t|
    t.datetime "open_time"
    t.decimal "open", precision: 15, scale: 8
    t.decimal "high", precision: 15, scale: 8
    t.decimal "low", precision: 15, scale: 8
    t.decimal "close", precision: 15, scale: 8
    t.decimal "volume", precision: 25, scale: 8
    t.decimal "avg_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spot1h_candles", force: :cascade do |t|
    t.datetime "open_time"
    t.decimal "open", precision: 15, scale: 8
    t.decimal "high", precision: 15, scale: 8
    t.decimal "low", precision: 15, scale: 8
    t.decimal "close", precision: 15, scale: 8
    t.decimal "volume", precision: 25, scale: 8
    t.decimal "avg_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spot30m_candles", force: :cascade do |t|
    t.datetime "open_time"
    t.decimal "open", precision: 15, scale: 8
    t.decimal "high", precision: 15, scale: 8
    t.decimal "low", precision: 15, scale: 8
    t.decimal "close", precision: 15, scale: 8
    t.decimal "volume", precision: 25, scale: 8
    t.decimal "avg_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spot4h_candles", force: :cascade do |t|
    t.datetime "open_time"
    t.decimal "open", precision: 15, scale: 8
    t.decimal "high", precision: 15, scale: 8
    t.decimal "low", precision: 15, scale: 8
    t.decimal "close", precision: 15, scale: 8
    t.decimal "volume", precision: 25, scale: 8
    t.decimal "avg_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "nickname"
    t.string "first_name"
    t.string "last_name"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end
