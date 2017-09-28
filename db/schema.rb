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

ActiveRecord::Schema.define(version: 20170928183733) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.string   "name",                   limit: 255
    t.boolean  "certified",                          default: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "article_references", force: :cascade do |t|
    t.integer "article_id"
    t.integer "reference_id"
  end

  create_table "article_tags", force: :cascade do |t|
    t.integer "article_id"
    t.integer "tag_id"
  end

  create_table "articles", force: :cascade do |t|
    t.text     "title"
    t.text     "sub_title"
    t.text     "main_content"
    t.string   "twitter_share_text", limit: 255
    t.datetime "posted_on"
    t.integer  "admin_id"
    t.boolean  "visible",                        default: false
  end

  create_table "auth_codes", force: :cascade do |t|
    t.string  "code",     limit: 255
    t.integer "admin_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "figures", force: :cascade do |t|
    t.string   "fig_name",            limit: 255
    t.integer  "order_fig"
    t.integer  "article_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "figures", ["article_id"], name: "index_figures_on_article_id", using: :btree

  create_table "references", force: :cascade do |t|
    t.text "name"
  end

  create_table "sections", force: :cascade do |t|
    t.text    "content"
    t.integer "article_id"
    t.integer "order_num"
  end

  add_index "sections", ["article_id"], name: "index_sections_on_article_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "widgets", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
