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

ActiveRecord::Schema.define(version: 20180326162832) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: :cascade do |t|
    t.string "author_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "book_details", force: :cascade do |t|
    t.string "book_name"
    t.string "book_number"
    t.string "book_edition"
    t.string "author_type"
    t.bigint "domain_id"
    t.bigint "author_id"
    t.bigint "publisher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_book_details_on_author_id"
    t.index ["domain_id"], name: "index_book_details_on_domain_id"
    t.index ["publisher_id"], name: "index_book_details_on_publisher_id"
  end

  create_table "book_docs", force: :cascade do |t|
    t.string "book_name"
    t.string "pdf_doc"
    t.bigint "book_detail_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_detail_id"], name: "index_book_docs_on_book_detail_id"
  end

  create_table "bookids", force: :cascade do |t|
    t.string "book_id"
    t.boolean "is_issue"
    t.boolean "is_blocked"
    t.bigint "book_detail_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_detail_id"], name: "index_bookids_on_book_detail_id"
  end

  create_table "domains", force: :cascade do |t|
    t.string "domain_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "entries", force: :cascade do |t|
    t.boolean "tempissue"
    t.boolean "is_returned"
    t.string "issue_date"
    t.string "return_date"
    t.bigint "bookid_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bookid_id"], name: "index_entries_on_bookid_id"
    t.index ["user_id"], name: "index_entries_on_user_id"
  end

  create_table "publishers", force: :cascade do |t|
    t.string "publisher_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "role_name"
    t.string "description"
    t.string "role_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "user_id"
    t.string "email"
    t.string "password"
    t.string "mobile"
    t.bigint "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "book_details", "authors"
  add_foreign_key "book_details", "domains"
  add_foreign_key "book_details", "publishers"
  add_foreign_key "book_docs", "book_details"
  add_foreign_key "bookids", "book_details"
  add_foreign_key "entries", "bookids"
  add_foreign_key "entries", "users"
  add_foreign_key "users", "roles"
end
