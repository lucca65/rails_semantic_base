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

ActiveRecord::Schema.define(version: 20160912215431) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_user_companies", force: :cascade do |t|
    t.integer "company_id"
    t.integer "admin_user_id"
  end

  add_index "admin_user_companies", ["admin_user_id"], name: "index_admin_user_companies_on_admin_user_id", using: :btree
  add_index "admin_user_companies", ["company_id"], name: "index_admin_user_companies_on_company_id", using: :btree

  create_table "admin_user_transaction_types", force: :cascade do |t|
    t.integer "admin_user_id"
    t.integer "transaction_type_id"
  end

  add_index "admin_user_transaction_types", ["admin_user_id"], name: "index_admin_user_transaction_types_on_admin_user_id", using: :btree
  add_index "admin_user_transaction_types", ["transaction_type_id"], name: "index_admin_user_transaction_types_on_transaction_type_id", using: :btree

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

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "audits", force: :cascade do |t|
    t.integer  "auditable_id"
    t.string   "auditable_type"
    t.integer  "associated_id"
    t.string   "associated_type"
    t.integer  "user_id"
    t.string   "user_type"
    t.string   "username"
    t.string   "action"
    t.text     "audited_changes"
    t.integer  "version",         default: 0
    t.string   "comment"
    t.string   "remote_address"
    t.string   "request_uuid"
    t.datetime "created_at"
  end

  add_index "audits", ["associated_id", "associated_type"], name: "associated_index", using: :btree
  add_index "audits", ["auditable_id", "auditable_type"], name: "auditable_index", using: :btree
  add_index "audits", ["created_at"], name: "index_audits_on_created_at", using: :btree
  add_index "audits", ["request_uuid"], name: "index_audits_on_request_uuid", using: :btree
  add_index "audits", ["user_id", "user_type"], name: "user_index", using: :btree

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.string   "document"
    t.string   "address"
    t.string   "address_number"
    t.string   "address_complement"
    t.string   "address_neighborhood"
    t.string   "address_city"
    t.string   "address_state"
    t.string   "address_zip"
    t.string   "avatar"
    t.decimal  "lat"
    t.decimal  "lng"
    t.boolean  "status"
    t.string   "facebook_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "companies", ["email"], name: "index_companies_on_email", unique: true, using: :btree

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

# Could not dump table "users" because of following StandardError
#   Unknown type 'gender' for column 'gender'

  add_foreign_key "admin_user_companies", "admin_users"
  add_foreign_key "admin_user_companies", "companies"
  add_foreign_key "messages_users", "admin_users"
end
