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

ActiveRecord::Schema.define(version: 20160510154729) do

  create_table "chapters", force: :cascade do |t|
    t.string   "chapter_name"
    t.string   "chapter_type"
    t.string   "campament"
    t.integer  "chapter_president_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "demolay_in_charge_id"
  end

  add_index "chapters", ["chapter_president_id"], name: "index_chapters_on_chapter_president_id"
  add_index "chapters", ["demolay_in_charge_id"], name: "index_chapters_on_demolay_in_charge_id"

  create_table "charges", force: :cascade do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "charges", ["user_id"], name: "index_charges_on_user_id"

  create_table "degrees", force: :cascade do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "degrees", ["user_id"], name: "index_degrees_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "lastname"
    t.string   "demolayID"
    t.string   "role"
    t.string   "ci"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "chapter_consultant_id"
  end

  add_index "users", ["chapter_consultant_id"], name: "index_users_on_chapter_consultant_id"
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
