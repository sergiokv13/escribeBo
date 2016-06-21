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

ActiveRecord::Schema.define(version: 20160621093439) do

  create_table "announcements", force: :cascade do |t|
    t.string   "subject"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "degrees"
    t.string   "charges"
    t.integer  "chapter_id"
    t.integer  "campament_id"
  end

  add_index "announcements", ["campament_id"], name: "index_announcements_on_campament_id"
  add_index "announcements", ["chapter_id"], name: "index_announcements_on_chapter_id"

  create_table "campaments", force: :cascade do |t|
    t.string   "name"
    t.integer  "president_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "maestro_consejero_id"
  end

  add_index "campaments", ["maestro_consejero_id"], name: "index_campaments_on_maestro_consejero_id"
  add_index "campaments", ["president_id"], name: "index_campaments_on_president_id"

  create_table "chapters", force: :cascade do |t|
    t.string   "chapter_name"
    t.string   "chapter_type"
    t.string   "campament"
    t.integer  "chapter_president_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "campament_id"
    t.integer  "chapter_consultant_president_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "number"
  end

  add_index "chapters", ["campament_id"], name: "index_chapters_on_campament_id"
  add_index "chapters", ["chapter_consultant_president_id"], name: "index_chapters_on_chapter_consultant_president_id"
  add_index "chapters", ["chapter_president_id"], name: "index_chapters_on_chapter_president_id"

  create_table "charges", force: :cascade do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "campament_id"
    t.integer  "chapter_id"
  end

  add_index "charges", ["campament_id"], name: "index_charges_on_campament_id"
  add_index "charges", ["chapter_id"], name: "index_charges_on_chapter_id"
  add_index "charges", ["user_id"], name: "index_charges_on_user_id"

  create_table "degrees", force: :cascade do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "chapter_id"
    t.boolean  "president_aproved"
    t.boolean  "deputy_aproved"
    t.boolean  "oficial_aproved"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "degrees", ["chapter_id"], name: "index_degrees_on_chapter_id"
  add_index "degrees", ["user_id"], name: "index_degrees_on_user_id"

  create_table "inboxes", force: :cascade do |t|
    t.text     "subject"
    t.string   "content"
    t.integer  "user1_id"
    t.integer  "user2_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.boolean  "seen"
    t.boolean  "inbox_hidden"
    t.string   "inbox_att_file_name"
    t.string   "inbox_att_content_type"
    t.integer  "inbox_att_file_size"
    t.datetime "inbox_att_updated_at"
  end

  add_index "inboxes", ["user1_id"], name: "index_inboxes_on_user1_id"
  add_index "inboxes", ["user2_id"], name: "index_inboxes_on_user2_id"

  create_table "premiacions", force: :cascade do |t|
    t.string   "title"
    t.date     "date_of"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "premiacions", ["user_id"], name: "index_premiacions_on_user_id"

  create_table "transactions", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "mount"
    t.integer  "user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.boolean  "aproved"
    t.string   "transaction_type"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                          default: "", null: false
    t.string   "encrypted_password",             default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                  default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "lastname"
    t.string   "demolayID"
    t.string   "role"
    t.string   "ci"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.integer  "chapter_consultant_id"
    t.integer  "chapter_id"
    t.integer  "priory_id"
    t.integer  "court_id"
    t.boolean  "president_aproved"
    t.boolean  "deputy_aproved"
    t.boolean  "oficial_aproved"
    t.integer  "campament_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "registration_form_file_name"
    t.string   "registration_form_content_type"
    t.integer  "registration_form_file_size"
    t.datetime "registration_form_updated_at"
    t.date     "birth_date"
    t.boolean  "assurance"
    t.string   "adress"
    t.string   "city"
    t.string   "cellphone"
    t.string   "phone"
    t.integer  "godfather_id"
    t.date     "iniciacion"
    t.string   "father_name"
    t.string   "father_info"
    t.string   "father_adress"
    t.string   "father_mail"
    t.string   "mather_name"
    t.string   "mather_adress"
    t.string   "mather_mail"
    t.string   "estado_civil"
    t.string   "nombre_esposa"
    t.string   "taller_nombre"
    t.string   "taller_numero"
  end

  add_index "users", ["campament_id"], name: "index_users_on_campament_id"
  add_index "users", ["chapter_consultant_id"], name: "index_users_on_chapter_consultant_id"
  add_index "users", ["chapter_id"], name: "index_users_on_chapter_id"
  add_index "users", ["court_id"], name: "index_users_on_court_id"
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["godfather_id"], name: "index_users_on_godfather_id"
  add_index "users", ["priory_id"], name: "index_users_on_priory_id"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
