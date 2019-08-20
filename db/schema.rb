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

ActiveRecord::Schema.define(version: 2019_08_20_041931) do

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
    t.float "latitude"
    t.float "longitude"
    t.float "rate_per_kg"
    t.index ["user_id"], name: "index_banks_on_user_id"
  end

  create_table "collected_plastics", force: :cascade do |t|
    t.float "kg_collected"
    t.bigint "plastic_id"
    t.bigint "verification_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plastic_id"], name: "index_collected_plastics_on_plastic_id"
    t.index ["verification_id"], name: "index_collected_plastics_on_verification_id"
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
    t.bigint "bank_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "verification_id"
    t.index ["bank_id"], name: "index_collections_on_bank_id"
    t.index ["user_id"], name: "index_collections_on_user_id"
    t.index ["verification_id"], name: "index_collections_on_verification_id"
  end

  create_table "plastics", force: :cascade do |t|
    t.string "name"
    t.float "price_per_kg"
    t.bigint "bank_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bank_id"], name: "index_plastics_on_bank_id"
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
    t.bigint "user_id"
    t.index ["collection_id"], name: "index_reviews_on_collection_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
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
    t.boolean "business", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "verifications", force: :cascade do |t|
    t.float "total_amount"
    t.float "total_kg"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "payment_type"
    t.bigint "bank_id"
    t.index ["bank_id"], name: "index_verifications_on_bank_id"
  end

  add_foreign_key "bank_recyclables", "banks"
  add_foreign_key "bank_recyclables", "recyclables"
  add_foreign_key "banks", "users"
  add_foreign_key "collected_plastics", "plastics"
  add_foreign_key "collected_plastics", "verifications"
  add_foreign_key "collection_recyclables", "collections"
  add_foreign_key "collection_recyclables", "recyclables"
  add_foreign_key "collections", "banks"
  add_foreign_key "collections", "users"
  add_foreign_key "collections", "verifications"
  add_foreign_key "plastics", "banks"
  add_foreign_key "reviews", "collections"
  add_foreign_key "reviews", "users"
  add_foreign_key "verifications", "banks"
end
