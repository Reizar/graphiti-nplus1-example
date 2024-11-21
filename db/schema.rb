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

ActiveRecord::Schema[7.1].define(version: 2024_11_21_021745) do
  create_table "inspections", force: :cascade do |t|
    t.integer "tenancy_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tenancy_id"], name: "index_inspections_on_tenancy_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "agency_id"
  end

  create_table "tenancies", force: :cascade do |t|
    t.integer "property_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_tenancies_on_property_id"
  end

  create_table "tenancy_memberships", force: :cascade do |t|
    t.integer "tenancy_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tenancy_id"], name: "index_tenancy_memberships_on_tenancy_id"
    t.index ["user_id"], name: "index_tenancy_memberships_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "inspections", "tenancies"
  add_foreign_key "tenancies", "properties"
  add_foreign_key "tenancy_memberships", "tenancies"
  add_foreign_key "tenancy_memberships", "users"
end
