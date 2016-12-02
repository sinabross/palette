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

ActiveRecord::Schema.define(version: 20161202165806) do

  create_table "admins", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "ckeditor_assets", ["type"], name: "index_ckeditor_assets_on_type"

  create_table "eyedbs", force: :cascade do |t|
    t.string   "num"
    t.string   "wc"
    t.string   "season"
    t.string   "tone"
    t.string   "brand"
    t.string   "name"
    t.integer  "price"
    t.string   "size"
    t.integer  "zzim",       default: 0
    t.string   "pro_type"
    t.string   "glitter"
    t.string   "texture",    default: "매트"
    t.string   "image_url",  default: ""
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "feedbacks", force: :cascade do |t|
    t.string   "title"
    t.string   "content"
    t.string   "emailaddress"
    t.string   "pro_num",      default: ""
    t.string   "img_url",      default: ""
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "impressions", force: :cascade do |t|
    t.string   "impressionable_type"
    t.integer  "impressionable_id"
    t.integer  "user_id"
    t.string   "ip_address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lipdbs", force: :cascade do |t|
    t.string   "num"
    t.string   "image"
    t.string   "color_PA"
    t.string   "season_PA"
    t.string   "tone_PA"
    t.string   "color_BY"
    t.string   "season_BY"
    t.string   "tone_BY"
    t.string   "color_YS"
    t.string   "season_YS"
    t.string   "tone_YS"
    t.string   "color_total"
    t.string   "season_total"
    t.string   "tone_total"
    t.string   "comment_PA"
    t.string   "comment_BY"
    t.string   "comment_YS"
    t.string   "brand"
    t.string   "name"
    t.integer  "price"
    t.string   "size"
    t.integer  "zzim",         default: 0
    t.string   "pro_type"
    t.string   "glitter"
    t.string   "texture"
    t.string   "keyword"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "lips", force: :cascade do |t|
    t.string   "num"
    t.string   "image"
    t.string   "wc"
    t.string   "season"
    t.string   "tone"
    t.string   "brand"
    t.string   "name"
    t.string   "price"
    t.string   "size"
    t.string   "color"
    t.string   "pro_type"
    t.string   "glitter"
    t.string   "texture"
    t.string   "keyword"
    t.string   "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notices", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "punches", force: :cascade do |t|
    t.integer  "punchable_id",                          null: false
    t.string   "punchable_type", limit: 20,             null: false
    t.datetime "starts_at",                             null: false
    t.datetime "ends_at",                               null: false
    t.datetime "average_time",                          null: false
    t.integer  "hits",                      default: 1, null: false
  end

  add_index "punches", ["average_time"], name: "index_punches_on_average_time"
  add_index "punches", ["punchable_type", "punchable_id"], name: "punchable_index"

  create_table "reviews", force: :cascade do |t|
    t.string   "num"
    t.string   "content"
    t.string   "img_url",    default: ""
    t.string   "username"
    t.string   "userseason"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",  null: false
    t.string   "encrypted_password",     default: "",  null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,   null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "username"
    t.string   "userseason",             default: "봄"
    t.string   "provider"
    t.string   "uid"
    t.string   "birthday"
    t.boolean  "admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

  create_table "votes", force: :cascade do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"

end
