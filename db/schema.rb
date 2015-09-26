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

ActiveRecord::Schema.define(version: 20150603191047) do

  create_table "admin_user_transaction_types", force: :cascade do |t|
    t.integer "admin_user_id"
    t.integer "transaction_type_id"
  end

  add_index "admin_user_transaction_types", ["admin_user_id"], name: "index_admin_user_transaction_types_on_admin_user_id"
  add_index "admin_user_transaction_types", ["transaction_type_id"], name: "index_admin_user_transaction_types_on_transaction_type_id"

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "super",                  default: true
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "audits", force: :cascade do |t|
    t.integer  "admin_user_id"
    t.string   "action"
    t.string   "ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "audits", ["admin_user_id"], name: "index_audits_on_admin_user_id"

  create_table "messages", force: :cascade do |t|
    t.text     "text"
    t.integer  "message_type", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages_users", force: :cascade do |t|
    t.integer  "message_id"
    t.integer  "admin_user_id"
    t.boolean  "visualized",    default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
