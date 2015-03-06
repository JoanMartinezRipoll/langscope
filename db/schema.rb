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

ActiveRecord::Schema.define(version: 20150305133034) do

  create_table "countries", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "population", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "language_offers", force: :cascade do |t|
    t.integer  "school_id",   limit: 4
    t.integer  "language_id", limit: 4
    t.string   "level",       limit: 255
    t.integer  "price",       limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "language_offers", ["language_id"], name: "index_language_offers_on_language_id", using: :btree
  add_index "language_offers", ["school_id"], name: "index_language_offers_on_school_id", using: :btree

  create_table "languages", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "percent_languages", force: :cascade do |t|
    t.integer  "percentage_id", limit: 4
    t.integer  "language_id",   limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "percent_languages", ["language_id"], name: "index_percent_languages_on_language_id", using: :btree
  add_index "percent_languages", ["percentage_id"], name: "index_percent_languages_on_percentage_id", using: :btree

  create_table "percentages", force: :cascade do |t|
    t.float    "percent",    limit: 24
    t.integer  "country_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "percentages", ["country_id"], name: "index_percentages_on_country_id", using: :btree

  create_table "schools", force: :cascade do |t|
    t.string   "email",                  limit: 255
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "name",                   limit: 255
    t.string   "address",                limit: 255
    t.string   "plz",                    limit: 255
    t.integer  "country_id",             limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "schools", ["country_id"], name: "index_schools_on_country_id", using: :btree
  add_index "schools", ["email"], name: "index_schools_on_email", unique: true, using: :btree
  add_index "schools", ["reset_password_token"], name: "index_schools_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "language_offers", "languages"
  add_foreign_key "language_offers", "schools"
  add_foreign_key "percent_languages", "languages"
  add_foreign_key "percent_languages", "percentages"
  add_foreign_key "percentages", "countries"
  add_foreign_key "schools", "countries"
end
