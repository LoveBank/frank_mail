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

ActiveRecord::Schema.define(version: 20160216185526) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "profile_id"
    t.integer  "entry_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["entry_id"], name: "index_comments_on_entry_id", using: :btree
  add_index "comments", ["profile_id"], name: "index_comments_on_profile_id", using: :btree

  create_table "entries", force: :cascade do |t|
    t.boolean  "received"
    t.boolean  "private"
    t.integer  "rating"
    t.text     "note"
    t.datetime "occurred_on"
    t.integer  "linked_profile_id"
    t.integer  "integer"
    t.integer  "profile_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "entries", ["integer"], name: "index_entries_on_integer", using: :btree
  add_index "entries", ["linked_profile_id"], name: "index_entries_on_linked_profile_id", using: :btree
  add_index "entries", ["profile_id"], name: "index_entries_on_profile_id", using: :btree

  create_table "families", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "families", ["name"], name: "index_families_on_name", using: :btree

  create_table "frank_appointments", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "frank_comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "profile_id"
    t.integer  "entry_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "frank_comments", ["entry_id"], name: "index_frank_comments_on_entry_id", using: :btree
  add_index "frank_comments", ["profile_id"], name: "index_frank_comments_on_profile_id", using: :btree

  create_table "frank_entries", force: :cascade do |t|
    t.boolean  "received"
    t.boolean  "private"
    t.integer  "rating"
    t.text     "note"
    t.datetime "occurred_on"
    t.integer  "linked_profile_id"
    t.integer  "integer"
    t.integer  "profile_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "frank_entries", ["integer"], name: "index_frank_entries_on_integer", using: :btree
  add_index "frank_entries", ["linked_profile_id"], name: "index_frank_entries_on_linked_profile_id", using: :btree
  add_index "frank_entries", ["profile_id"], name: "index_frank_entries_on_profile_id", using: :btree

  create_table "frank_events", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "frank_families", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "frank_families", ["name"], name: "index_frank_families_on_name", using: :btree

  create_table "frank_love_banks", force: :cascade do |t|
    t.integer  "rating"
    t.text     "note"
    t.integer  "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "frank_love_banks", ["profile_id"], name: "index_frank_love_banks_on_profile_id", using: :btree

  create_table "frank_moods", force: :cascade do |t|
    t.integer  "rating"
    t.text     "note"
    t.integer  "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "frank_moods", ["profile_id"], name: "index_frank_moods_on_profile_id", using: :btree

  create_table "frank_profiles", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.string   "phone"
    t.integer  "family_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "last_daily_report_id"
  end

  add_index "frank_profiles", ["email"], name: "index_frank_profiles_on_email", using: :btree
  add_index "frank_profiles", ["family_id"], name: "index_frank_profiles_on_family_id", using: :btree

  create_table "love_banks", force: :cascade do |t|
    t.integer  "rating"
    t.text     "note"
    t.integer  "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "love_banks", ["profile_id"], name: "index_love_banks_on_profile_id", using: :btree

  create_table "moods", force: :cascade do |t|
    t.integer  "rating"
    t.text     "note"
    t.integer  "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "moods", ["profile_id"], name: "index_moods_on_profile_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.string   "phone"
    t.integer  "family_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "profiles", ["email"], name: "index_profiles_on_email", using: :btree
  add_index "profiles", ["family_id"], name: "index_profiles_on_family_id", using: :btree

  add_foreign_key "comments", "entries"
  add_foreign_key "comments", "profiles"
  add_foreign_key "entries", "profiles"
  add_foreign_key "frank_comments", "frank_entries", column: "entry_id"
  add_foreign_key "frank_comments", "frank_profiles", column: "profile_id"
  add_foreign_key "frank_entries", "frank_profiles", column: "profile_id"
  add_foreign_key "frank_love_banks", "frank_profiles", column: "profile_id"
  add_foreign_key "frank_moods", "frank_profiles", column: "profile_id"
  add_foreign_key "frank_profiles", "frank_families", column: "family_id"
  add_foreign_key "love_banks", "profiles"
  add_foreign_key "moods", "profiles"
  add_foreign_key "profiles", "families"
end
