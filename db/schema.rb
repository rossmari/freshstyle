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

ActiveRecord::Schema.define(version: 20141011154128) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "back_calls", force: true do |t|
    t.string   "phone"
    t.boolean  "answered"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "brands", force: true do |t|
    t.string   "title",       null: false
    t.text     "description"
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "carousels", force: true do |t|
    t.string   "header"
    t.string   "content_text"
    t.boolean  "main",                 default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  add_index "categories", ["parent_id"], name: "index_categories_on_parent_id", using: :btree
  add_index "categories", ["rgt"], name: "index_categories_on_rgt", using: :btree

  create_table "ckeditor_assets", force: true do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "client_messages", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "good_pictures", force: true do |t|
    t.integer  "good_id"
    t.boolean  "main_image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  create_table "goods", force: true do |t|
    t.string   "title",                             null: false
    t.string   "article"
    t.string   "color"
    t.text     "consist"
    t.string   "season"
    t.integer  "count_in_stock"
    t.integer  "price"
    t.integer  "percents_discount"
    t.integer  "monetary_discount"
    t.integer  "brand_id"
    t.integer  "category_id"
    t.integer  "origin_country_id"
    t.integer  "design_country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "main_offer",        default: false
  end

  create_table "goods_sizes", force: true do |t|
    t.integer  "good_id"
    t.integer  "size_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "main_offers", force: true do |t|
    t.string   "header"
    t.string   "content_text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  create_table "order_goods", force: true do |t|
    t.integer  "order_id"
    t.integer  "good_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "size_id"
  end

  create_table "orders", force: true do |t|
    t.string   "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "family"
    t.string   "second_name"
    t.string   "city"
    t.string   "post_index"
    t.string   "street"
  end

  create_table "pages", force: true do |t|
    t.string   "title",                      null: false
    t.text     "content"
    t.boolean  "enabled",    default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "row_order"
  end

  create_table "sizes", force: true do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.boolean  "is_admin",               default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
