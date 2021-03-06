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

ActiveRecord::Schema.define(version: 20141103234904) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: true do |t|
    t.float    "hours",        default: 0.0
    t.date     "date",                       null: false
    t.integer  "user_id",                    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.integer  "location_id"
    t.float    "travel_hours", default: 0.0
  end

  add_index "activities", ["location_id"], name: "index_activities_on_location_id", using: :btree
  add_index "activities", ["user_id"], name: "index_activities_on_user_id", using: :btree

  create_table "asset_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assets", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "asset_type_id"
    t.integer  "borrower_id"
    t.integer  "admin_id"
    t.text     "description"
    t.string   "status",        default: "Available"
    t.string   "brand"
    t.string   "model"
    t.float    "value",         default: 0.0
    t.string   "serial_number"
    t.date     "borrowed_on"
  end

  add_index "assets", ["admin_id"], name: "index_assets_on_admin_id", using: :btree
  add_index "assets", ["borrower_id"], name: "index_assets_on_borrower_id", using: :btree

  create_table "locations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "oauth_access_grants", force: true do |t|
    t.integer  "resource_owner_id", null: false
    t.integer  "application_id",    null: false
    t.string   "token",             null: false
    t.integer  "expires_in",        null: false
    t.text     "redirect_uri",      null: false
    t.datetime "created_at",        null: false
    t.datetime "revoked_at"
    t.string   "scopes"
  end

  add_index "oauth_access_grants", ["token"], name: "index_oauth_access_grants_on_token", unique: true, using: :btree

  create_table "oauth_access_tokens", force: true do |t|
    t.integer  "resource_owner_id"
    t.integer  "application_id"
    t.string   "token",             null: false
    t.string   "refresh_token"
    t.integer  "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at",        null: false
    t.string   "scopes"
  end

  add_index "oauth_access_tokens", ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true, using: :btree
  add_index "oauth_access_tokens", ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id", using: :btree
  add_index "oauth_access_tokens", ["token"], name: "index_oauth_access_tokens_on_token", unique: true, using: :btree

  create_table "oauth_applications", force: true do |t|
    t.string   "name",         null: false
    t.string   "uid",          null: false
    t.string   "secret",       null: false
    t.text     "redirect_uri", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "oauth_applications", ["uid"], name: "index_oauth_applications_on_uid", unique: true, using: :btree

  create_table "start_signals", force: true do |t|
    t.integer  "user_id"
    t.integer  "location_id"
    t.datetime "start_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "start_signals", ["location_id"], name: "index_start_signals_on_location_id", using: :btree
  add_index "start_signals", ["user_id"], name: "index_start_signals_on_user_id", using: :btree

  create_table "stop_signals", force: true do |t|
    t.integer  "start_signal_id"
    t.datetime "stop_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "timecards", force: true do |t|
    t.integer  "location_id"
    t.integer  "user_id"
    t.datetime "start_time"
    t.datetime "stop_time"
    t.boolean  "published",   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "activity_id"
    t.text     "notes"
  end

  add_index "timecards", ["activity_id"], name: "index_timecards_on_activity_id", using: :btree
  add_index "timecards", ["location_id"], name: "index_timecards_on_location_id", using: :btree
  add_index "timecards", ["user_id"], name: "index_timecards_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "invitations_count",      default: 0
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
  add_index "users", ["invitations_count"], name: "index_users_on_invitations_count", using: :btree
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
