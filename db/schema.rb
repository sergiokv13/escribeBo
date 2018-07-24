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

ActiveRecord::Schema.define(version: 20180724124821) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.boolean  "president_aproved"
    t.boolean  "oficial_aproved"
  end

  add_index "announcements", ["campament_id"], name: "index_announcements_on_campament_id", using: :btree
  add_index "announcements", ["chapter_id"], name: "index_announcements_on_chapter_id", using: :btree

  create_table "banners", force: :cascade do |t|
    t.text     "description"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "pic_file_name"
    t.string   "pic_content_type"
    t.integer  "pic_file_size"
    t.datetime "pic_updated_at"
  end

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

  create_table "campaments_user_follows", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "campament_id"
    t.integer  "number_views"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "campaments_user_follows", ["campament_id"], name: "index_campaments_user_follows_on_campament_id", using: :btree
  add_index "campaments_user_follows", ["user_id"], name: "index_campaments_user_follows_on_user_id", using: :btree

  create_table "chapter_user_follows", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "chapter_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "number_views"
  end

  add_index "chapter_user_follows", ["chapter_id"], name: "index_chapter_user_follows_on_chapter_id", using: :btree
  add_index "chapter_user_follows", ["user_id"], name: "index_chapter_user_follows_on_user_id", using: :btree

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
    t.boolean  "sleep"
    t.date     "aniversary"
  end

  add_index "chapters", ["campament_id"], name: "index_chapters_on_campament_id", using: :btree

  create_table "charges", force: :cascade do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "campament_id"
    t.integer  "chapter_id"
    t.string   "ente"
  end

  add_index "charges", ["campament_id"], name: "index_charges_on_campament_id", using: :btree
  add_index "charges", ["chapter_id"], name: "index_charges_on_chapter_id", using: :btree
  add_index "charges", ["user_id"], name: "index_charges_on_user_id", using: :btree

  create_table "charges_histories", force: :cascade do |t|
    t.string   "title"
    t.integer  "user_id"
    t.integer  "campament_id"
    t.integer  "chapter_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "gestion"
  end

  add_index "charges_histories", ["campament_id"], name: "index_charges_histories_on_campament_id", using: :btree
  add_index "charges_histories", ["chapter_id"], name: "index_charges_histories_on_chapter_id", using: :btree
  add_index "charges_histories", ["user_id"], name: "index_charges_histories_on_user_id", using: :btree

  create_table "current_fees", force: :cascade do |t|
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

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
    t.text     "reject_note"
    t.datetime "date"
  end

  add_index "degrees", ["chapter_id"], name: "index_degrees_on_chapter_id", using: :btree
  add_index "degrees", ["user_id"], name: "index_degrees_on_user_id", using: :btree

  create_table "inboxes", force: :cascade do |t|
    t.text     "subject"
    t.text     "content"
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
    t.boolean  "inbox_hidden_sender"
  end

  create_table "oficer_ans", force: :cascade do |t|
    t.string   "text"
    t.string   "title"
    t.date     "deadline"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
  end

  create_table "premiacions", force: :cascade do |t|
    t.string   "title"
    t.date     "date_of"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
  end

  create_table "transactions", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.boolean  "aproved"
    t.string   "transaction_type"
    t.text     "concept_type"
    t.string   "receipt_number"
    t.string   "plantilla_file_name"
    t.string   "plantilla_content_type"
    t.integer  "plantilla_file_size"
    t.datetime "plantilla_updated_at"
    t.float    "float_amount"
    t.integer  "chapter_id"
  end

  create_table "user_premiations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "premiacion_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.date     "date_of"
  end

  add_index "user_premiations", ["premiacion_id"], name: "index_user_premiations_on_premiacion_id", using: :btree
  add_index "user_premiations", ["user_id"], name: "index_user_premiations_on_user_id", using: :btree

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
    t.text     "reject_note"
    t.string   "full_name"
    t.boolean  "blocked"
  end

  add_index "users", ["campament_id"], name: "index_users_on_campament_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "announcements", "campaments"
  add_foreign_key "announcements", "chapters"
  add_foreign_key "campaments_user_follows", "campaments"
  add_foreign_key "campaments_user_follows", "users"
  add_foreign_key "chapter_user_follows", "chapters"
  add_foreign_key "chapter_user_follows", "users"
  add_foreign_key "chapters", "campaments"
  add_foreign_key "charges", "campaments"
  add_foreign_key "charges", "chapters"
  add_foreign_key "charges", "users"
  add_foreign_key "charges_histories", "campaments"
  add_foreign_key "charges_histories", "chapters"
  add_foreign_key "charges_histories", "users"
  add_foreign_key "degrees", "chapters"
  add_foreign_key "degrees", "users"
  add_foreign_key "user_premiations", "premiacions"
  add_foreign_key "user_premiations", "users"
  add_foreign_key "users", "campaments"
end
