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

ActiveRecord::Schema.define(version: 20180424200207) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.integer  "role"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "cash_flows", force: :cascade do |t|
    t.float    "entry_cash"
    t.float    "cash_outflow"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "members", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "members", ["email"], name: "index_members_on_email", unique: true, using: :btree
  add_index "members", ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true, using: :btree

  create_table "mensalists", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.float    "price"
    t.integer  "days_of_tolerance"
    t.datetime "first_invoice_date"
    t.datetime "invoice_date"
    t.string   "plates"
    t.integer  "car_seat_numbers"
    t.integer  "payment_status",     default: 1
    t.jsonb    "services",           default: {}
    t.integer  "park_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.datetime "past_invoice_date"
  end

  add_index "mensalists", ["park_id"], name: "index_mensalists_on_park_id", using: :btree

  create_table "parks", force: :cascade do |t|
    t.string  "park_name"
    t.integer "park_spots"
    t.string  "park_cnpj"
    t.string  "park_location"
    t.string  "operating_hours"
  end

  create_table "services", force: :cascade do |t|
    t.string   "name"
    t.float    "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicles", force: :cascade do |t|
    t.string   "plate"
    t.string   "color"
    t.string   "model"
    t.string   "email"
    t.text     "observations"
    t.float    "total_to_pay",    default: 0.0
    t.integer  "permanence_type", default: 1
    t.integer  "payment_status",  default: 1
    t.date     "checkout_date"
    t.jsonb    "services",        default: {}
    t.integer  "park_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "vehicles", ["park_id"], name: "index_vehicles_on_park_id", using: :btree

  add_foreign_key "mensalists", "parks"
  add_foreign_key "vehicles", "parks"
end
