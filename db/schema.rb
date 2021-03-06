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

ActiveRecord::Schema.define(version: 20160819122437) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "content"
    t.text     "name"
    t.integer  "post_id"
  end

  create_table "images", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "img_file_name"
    t.string   "img_content_type"
    t.integer  "img_file_size"
    t.datetime "img_updated_at"
    t.integer  "post_id"
    t.string   "img"
  end

  create_table "images_posts", id: false, force: true do |t|
    t.integer  "image_id"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "images_posts", ["image_id"], name: "index_images_posts_on_image_id", using: :btree
  add_index "images_posts", ["post_id"], name: "index_images_posts_on_post_id", using: :btree

  create_table "keys", force: true do |t|
    t.text     "token"
    t.boolean  "used"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "users_id"
  end

  create_table "posts", force: true do |t|
    t.text     "title"
    t.text     "content"
    t.text     "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "imgs",                default: [], array: true
  end

  create_table "roles", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "type"
  end

  create_table "users", force: true do |t|
    t.text     "username"
    t.text     "password"
    t.text     "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "email"
    t.integer  "role_id"
  end

end
