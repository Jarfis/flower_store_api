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

ActiveRecord::Schema.define(version: 20170313174254) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "card_token"
    t.string   "brand"
    t.string   "last4"
    t.string   "expiry_month"
    t.string   "expiry_year"
    t.boolean  "default"
    t.boolean  "archived",     default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "cards", ["user_id"], name: "index_cards_on_user_id", using: :btree

  create_table "contacts", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "province"
    t.string   "city"
    t.string   "postal_code"
    t.string   "address"
    t.string   "phone"
    t.boolean  "default"
    t.boolean  "archived",    default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "contacts", ["user_id"], name: "index_contacts_on_user_id", using: :btree

  create_table "flowers", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.float    "price"
    t.integer  "stock"
    t.string   "image"
    t.boolean  "archived",    default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "remaining"
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "card_id"
    t.integer  "contact_id"
    t.string   "status",     default: "in_progress"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "orders", ["card_id"], name: "index_orders_on_card_id", using: :btree
  add_index "orders", ["contact_id"], name: "index_orders_on_contact_id", using: :btree
  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "orders_flowers", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "flower_id"
    t.integer  "quantity"
    t.float    "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "orders_flowers", ["flower_id"], name: "index_orders_flowers_on_flower_id", using: :btree
  add_index "orders_flowers", ["order_id"], name: "index_orders_flowers_on_order_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "email"
    t.json     "tokens"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "stripe_user"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree

  add_foreign_key "cards", "users"
  add_foreign_key "contacts", "users"
  add_foreign_key "orders", "cards"
  add_foreign_key "orders", "contacts"
  add_foreign_key "orders", "users"
  add_foreign_key "orders_flowers", "flowers"
  add_foreign_key "orders_flowers", "orders"
end
