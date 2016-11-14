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

ActiveRecord::Schema.define(version: 20161114023714) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "circumscriptions", force: :cascade do |t|
    t.integer  "number",     null: false
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "districts", force: :cascade do |t|
    t.integer  "number",             null: false
    t.integer  "circumscription_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["circumscription_id"], name: "index_districts_on_circumscription_id", using: :btree
  end

  create_table "initiative_signs", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "email"
    t.integer  "initiative_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["initiative_id", "user_id"], name: "index_initiative_signs_on_initiative_id_and_user_id", unique: true, using: :btree
    t.index ["initiative_id"], name: "index_initiative_signs_on_initiative_id", using: :btree
    t.index ["user_id"], name: "index_initiative_signs_on_user_id", using: :btree
  end

  create_table "initiatives", force: :cascade do |t|
    t.string   "title",                       null: false
    t.string   "description",                 null: false
    t.string   "image"
    t.boolean  "active",      default: false
    t.string   "hashtag"
    t.integer  "ong_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["ong_id"], name: "index_initiatives_on_ong_id", using: :btree
  end

  create_table "municipalities", force: :cascade do |t|
    t.string   "name",        null: false
    t.integer  "district_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["district_id"], name: "index_municipalities_on_district_id", using: :btree
  end

  create_table "ongs", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "logo"
    t.string   "email"
    t.string   "description", null: false
    t.string   "webpage"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "logo_data"
    t.index ["name"], name: "index_ongs_on_name", using: :btree
  end

  create_table "ongs_users", id: false, force: :cascade do |t|
    t.integer "ong_id",  null: false
    t.integer "user_id", null: false
    t.index ["user_id", "ong_id"], name: "index_ongs_users_on_user_id_and_ong_id", using: :btree
  end

  create_table "parties", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "logo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "representatives", force: :cascade do |t|
    t.string   "type"
    t.string   "name"
    t.string   "photo"
    t.string   "email"
    t.integer  "party_id"
    t.integer  "circumscription_id"
    t.integer  "district_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["circumscription_id"], name: "index_representatives_on_circumscription_id", using: :btree
    t.index ["district_id"], name: "index_representatives_on_district_id", using: :btree
    t.index ["party_id"], name: "index_representatives_on_party_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",           null: false
    t.string   "first_name",      null: false
    t.string   "last_name",       null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "token"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["token"], name: "index_users_on_token", unique: true, using: :btree
  end

  add_foreign_key "districts", "circumscriptions"
  add_foreign_key "initiative_signs", "initiatives"
  add_foreign_key "initiative_signs", "users"
  add_foreign_key "initiatives", "ongs"
  add_foreign_key "municipalities", "districts"
  add_foreign_key "representatives", "circumscriptions"
  add_foreign_key "representatives", "districts"
  add_foreign_key "representatives", "parties"
end
