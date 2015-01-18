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

ActiveRecord::Schema.define(version: 20150118211354) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "role_users", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "role_id",    null: false
    t.text     "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "role_users", ["role_id"], name: "index_role_users_on_role_id", using: :btree
  add_index "role_users", ["user_id"], name: "index_role_users_on_user_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name",       limit: 32, null: false
    t.text     "info"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "roles", ["name"], name: "index_roles_on_name", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "login",      limit: 32, null: false
    t.text     "info"
    t.text     "data"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "users", ["login"], name: "index_users_on_login", unique: true, using: :btree

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

  add_foreign_key "role_users", "roles"
  add_foreign_key "role_users", "users"
end
