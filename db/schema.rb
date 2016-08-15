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

ActiveRecord::Schema.define(version: 20160806100238) do

  create_table "eyedbs", force: :cascade do |t|
    t.string   "num"
    t.string   "wc"
    t.string   "season"
    t.string   "tone"
    t.string   "brand"
    t.string   "name"
    t.integer  "price"
    t.string   "size"
    t.integer  "zzim"
    t.string   "pro_type"
    t.boolean  "glitter"
    t.string   "image_url",  default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "lipdbs", force: :cascade do |t|
    t.string   "num"
    t.string   "wc"
    t.string   "season"
    t.string   "tone"
    t.string   "brand"
    t.string   "name"
    t.integer  "price"
    t.string   "size"
    t.integer  "zzim"
    t.string   "pro_type"
    t.boolean  "glitter"
    t.string   "texture"
    t.string   "image_url",  default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

end
