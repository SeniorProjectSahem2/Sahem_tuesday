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

ActiveRecord::Schema.define(version: 20171126080023) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contracts", force: :cascade do |t|
    t.integer  "rental_id"
    t.float    "amount"
    t.string   "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "contracts", ["rental_id"], name: "index_contracts_on_rental_id"

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "size"
    t.float    "weight"
    t.integer  "quantity"
    t.float    "daily_price"
    t.float    "weekly_price"
    t.float    "monthly_price"
    t.integer  "user_id"
    t.integer  "category_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "image2_file_name"
    t.string   "image2_content_type"
    t.integer  "image2_file_size"
    t.datetime "image2_updated_at"
    t.string   "image3_file_name"
    t.string   "image3_content_type"
    t.integer  "image3_file_size"
    t.datetime "image3_updated_at"
  end

  add_index "items", ["category_id"], name: "index_items_on_category_id"
  add_index "items", ["user_id"], name: "index_items_on_user_id"

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "recipient_id"
    t.integer  "actor_id"
    t.datetime "read_at"
    t.string   "action"
    t.integer  "notifiable_id"
    t.string   "notifiable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "stars"
    t.text     "comment"
    t.integer  "user_id"
    t.integer  "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "ratings", ["item_id"], name: "index_ratings_on_item_id"
  add_index "ratings", ["user_id"], name: "index_ratings_on_user_id"

  create_table "rentals", force: :cascade do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.string   "status"
    t.integer  "user_id"
    t.integer  "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "quantity"
    t.text     "comment"
  end

  add_index "rentals", ["item_id"], name: "index_rentals_on_item_id"
  add_index "rentals", ["user_id"], name: "index_rentals_on_user_id"

  create_table "transactions", force: :cascade do |t|
    t.string   "item_name"
    t.integer  "borrower_id"
    t.integer  "lender_id"
    t.integer  "item_id"
    t.integer  "rental_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.date     "start_date"
    t.date     "end_date"
  end

  add_index "transactions", ["item_id"], name: "index_transactions_on_item_id"
  add_index "transactions", ["rental_id"], name: "index_transactions_on_rental_id"

  create_table "user_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "location_id"
    t.integer  "user_type_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "email",                   default: "", null: false
    t.string   "encrypted_password",      default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",           default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "phone_number"
    t.string   "profilepic_file_name"
    t.string   "profilepic_content_type"
    t.integer  "profilepic_file_size"
    t.datetime "profilepic_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["location_id"], name: "index_users_on_location_id"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["user_type_id"], name: "index_users_on_user_type_id"

end
