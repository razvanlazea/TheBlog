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

ActiveRecord::Schema.define(version: 20160729081411) do

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
  end

  create_table "images_posts", id: false, force: true do |t|
    t.integer  "image_id"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "images_posts", ["image_id"], name: "index_images_posts_on_image_id", using: :btree
  add_index "images_posts", ["post_id"], name: "index_images_posts_on_post_id", using: :btree

  create_table "posts", force: true do |t|
    t.text     "title"
    t.text     "content"
    t.text     "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rezs", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "sala"
  end

  create_table "rezs_users", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "rez_id"
  end

  add_index "rezs_users", ["rez_id"], name: "index_rezs_users_on_rez_id", using: :btree
  add_index "rezs_users", ["user_id"], name: "index_rezs_users_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.text     "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "age"
    t.text     "email"
  end

end
