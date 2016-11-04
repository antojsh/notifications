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

ActiveRecord::Schema.define(version: 20161020171720) do

  create_table "movements", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "debito"
    t.integer  "credito"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "movements", ["user_id"], name: "index_movements_on_user_id"

  create_table "notifications", force: :cascade do |t|
    t.text     "message"
    t.string   "receiver"
    t.date     "send_date"
    t.boolean  "sent"
    t.string   "response"
    t.date     "response_date"
    t.integer  "user_id"
    t.integer  "service_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "notifications", ["service_id"], name: "index_notifications_on_service_id"
  add_index "notifications", ["user_id"], name: "index_notifications_on_user_id"

  create_table "operations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "service_id"
    t.integer  "total"
    t.boolean  "ilimitado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "unit_price"
  end

  add_index "operations", ["service_id"], name: "index_operations_on_service_id"
  add_index "operations", ["user_id"], name: "index_operations_on_user_id"

  create_table "packages", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "price"
    t.boolean  "active"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "service_packages", force: :cascade do |t|
    t.integer  "service_id"
    t.integer  "package_id"
    t.integer  "total"
    t.boolean  "ilimitado"
    t.integer  "unit_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "service_packages", ["package_id"], name: "index_service_packages_on_package_id"
  add_index "service_packages", ["service_id"], name: "index_service_packages_on_service_id"

  create_table "services", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "total"
    t.integer  "price"
    t.string   "method"
    t.boolean  "ilimitado"
  end

  create_table "tokens", force: :cascade do |t|
    t.datetime "expires_at"
    t.integer  "user_id"
    t.string   "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tokens", ["user_id"], name: "index_tokens_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "last_name"
    t.string   "identification"
    t.string   "email"
    t.string   "api_key"
    t.string   "api_secret"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "user_type"
    t.integer  "package_id"
  end

  add_index "users", ["package_id"], name: "index_users_on_package_id"

end
