# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_27_033103) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "master_lists", force: :cascade do |t|
    t.string "name"
    t.text "application"
    t.bigint "user_id", null: false
    t.string "package"
    t.string "data_sheet_url"
    t.string "safety_sheet_url"
    t.boolean "archived", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "name_hidden", default: false, null: false
    t.boolean "application_hidden", default: false, null: false
    t.boolean "package_hidden", default: false, null: false
    t.boolean "data_sheet_hidden", default: false, null: false
    t.boolean "safety_sheet_hidden", default: false, null: false
    t.index ["user_id"], name: "index_master_lists_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "manufacturing_date"
    t.string "product_code"
    t.string "aasm_state"
    t.string "qr_code"
    t.boolean "manufacturing_date_hidden", default: false, null: false
    t.boolean "product_code_hidden", default: false, null: false
    t.integer "master_list_id", null: false
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "qr_codes", force: :cascade do |t|
    t.string "data"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.bigint "role_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "master_lists", "users"
  add_foreign_key "products", "users"
end
