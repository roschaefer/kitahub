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

ActiveRecord::Schema.define(version: 20161021041228) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "nurseries", force: :cascade do |t|
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "name"
    t.string   "address_street"
    t.string   "address_zip"
    t.string   "address_city"
    t.string   "phone"
    t.string   "mail"
    t.string   "children_age"
    t.string   "care_time"
    t.string   "education_concept"
    t.string   "management"
    t.string   "capacity"
    t.string   "district"
  end

  create_table "parents", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_parents_on_user_id", using: :btree
  end

  create_table "registrations", force: :cascade do |t|
    t.integer  "parents_id", null: false
    t.integer  "nursery_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nursery_id"], name: "index_registrations_on_nursery_id", using: :btree
    t.index ["parents_id"], name: "index_registrations_on_parents_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "parents", "users"
end
