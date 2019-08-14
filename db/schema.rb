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

ActiveRecord::Schema.define(version: 2019_08_14_041824) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bank_recyclables", force: :cascade do |t|
    t.float "rate_per_kg"
    t.bigint "bank_id"
    t.bigint "recyclable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bank_id"], name: "index_bank_recyclables_on_bank_id"
    t.index ["recyclable_id"], name: "index_bank_recyclables_on_recyclable_id"
  end

  create_table "banks", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phone_number"
    t.string "website"
    t.string "country"
    t.string "materials_accepted"
    t.string "products_accepted"
    t.index ["user_id"], name: "index_banks_on_user_id"
  end

  create_table "collection_recyclables", force: :cascade do |t|
    t.integer "kg_collected"
    t.bigint "collection_id"
    t.bigint "recyclable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["collection_id"], name: "index_collection_recyclables_on_collection_id"
    t.index ["recyclable_id"], name: "index_collection_recyclables_on_recyclable_id"
  end

  create_table "collections", force: :cascade do |t|
    t.date "date"
    t.float "total_kg"
    t.float "total_amount"
    t.string "payment_type"
    t.bigint "user_id"
    t.bigint "bank_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bank_id"], name: "index_collections_on_bank_id"
    t.index ["user_id"], name: "index_collections_on_user_id"
  end

  create_table "recyclables", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.bigint "collection_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "comment"
    t.index ["collection_id"], name: "index_reviews_on_collection_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "phone_number"
    t.string "bitcoin_address"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bank_recyclables", "banks"
  add_foreign_key "bank_recyclables", "recyclables"
  add_foreign_key "banks", "users"
  add_foreign_key "collection_recyclables", "collections"
  add_foreign_key "collection_recyclables", "recyclables"
  add_foreign_key "collections", "banks"
  add_foreign_key "collections", "users"
  add_foreign_key "reviews", "collections"
end
