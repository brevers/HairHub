# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

<<<<<<< HEAD
ActiveRecord::Schema[7.0].define(version: 2023_07_30_135724) do
=======
ActiveRecord::Schema[7.0].define(version: 2023_06_01_180018) do
>>>>>>> 771bce5202c1e6251f10cb3e73e7b5c3e952babc
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agencies", force: :cascade do |t|
    t.string "name"
    t.string "pitch"
    t.decimal "latitude", precision: 10, scale: 6
    t.decimal "longitude", precision: 10, scale: 6
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "phone"
  end

  create_table "messages", force: :cascade do |t|
    t.integer "user_id"
    t.integer "agency_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plans", force: :cascade do |t|
    t.string "title"
    t.text "description"
<<<<<<< HEAD
    t.string "image"
    t.integer "price"
    t.bigint "agency_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agency_id"], name: "index_plans_on_agency_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string "name", null: false
    t.integer "price", null: false
    t.boolean "active"
=======
    t.float "price"
    t.integer "agency_id"
>>>>>>> 771bce5202c1e6251f10cb3e73e7b5c3e952babc
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

<<<<<<< HEAD
  create_table "user_agencies", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "agency_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agency_id"], name: "index_user_agencies_on_agency_id"
    t.index ["user_id"], name: "index_user_agencies_on_user_id"
  end

  create_table "user_subscriptions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "subscription_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subscription_id"], name: "index_user_subscriptions_on_subscription_id"
    t.index ["user_id"], name: "index_user_subscriptions_on_user_id"
=======
  create_table "sales", force: :cascade do |t|
    t.bigint "plan_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plan_id"], name: "index_sales_on_plan_id"
    t.index ["user_id"], name: "index_sales_on_user_id"
>>>>>>> 771bce5202c1e6251f10cb3e73e7b5c3e952babc
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "role", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.bigint "subscription_id"
    t.string "stripe_reference_id"
    t.string "stripe_customer_id"
    t.string "stripe_subscription_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["subscription_id"], name: "index_users_on_subscription_id"
  end

<<<<<<< HEAD
  add_foreign_key "plans", "agencies"
  add_foreign_key "user_agencies", "agencies"
  add_foreign_key "user_agencies", "users"
  add_foreign_key "user_subscriptions", "subscriptions"
  add_foreign_key "user_subscriptions", "users"
  add_foreign_key "users", "subscriptions"
=======
  add_foreign_key "sales", "plans"
  add_foreign_key "sales", "users"
>>>>>>> 771bce5202c1e6251f10cb3e73e7b5c3e952babc
end
