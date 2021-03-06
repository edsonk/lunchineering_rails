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

ActiveRecord::Schema.define(version: 20151016213410) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "destinations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_destination_options", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "destination_id"
    t.boolean  "selected",       default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_votes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.integer  "destination_option_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "event_votes", ["destination_option_id"], name: "index_event_votes_on_destination_option_id", using: :btree
  add_index "event_votes", ["event_id"], name: "index_event_votes_on_event_id", using: :btree
  add_index "event_votes", ["user_id"], name: "index_event_votes_on_user_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.datetime "expires_at"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "authentication_token"
    t.string   "api_key"
    t.string   "name"
  end

  add_index "users", ["api_key"], name: "index_users_on_api_key", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
