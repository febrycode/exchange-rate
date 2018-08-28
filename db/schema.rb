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

ActiveRecord::Schema.define(version: 2018_08_28_031120) do

  create_table "daily_exchange_rates", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "exchange_code_id"
    t.datetime "date_input"
    t.decimal "rate_value", precision: 8, scale: 6
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exchange_code_id"], name: "index_daily_exchange_rates_on_exchange_code_id"
  end

  create_table "exchange_codes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "code_from", limit: 3
    t.string "code_to", limit: 3
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
