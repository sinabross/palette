<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> dd23e12dec804e9082952207ff701f3c6f9a845b
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

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20161024074350) do
=======
ActiveRecord::Schema.define(version: 20161202165806) do
>>>>>>> a1756987233a3b897f92eecb7f60b35a6824525d
=======
ActiveRecord::Schema.define(version: 20170201075032) do
>>>>>>> dd23e12dec804e9082952207ff701f3c6f9a845b
=======
ActiveRecord::Schema.define(version: 20170215022101) do
>>>>>>> 0951e4a1ee9dfa7a2b7e9620f4141235e39d9275
=======
ActiveRecord::Schema.define(version: 20170215064526) do
>>>>>>> 1e743e9743d8a53f809af04c35898a2255ef3d1b
=======
ActiveRecord::Schema.define(version: 20170221094648) do
>>>>>>> 7357919165088f27c151db0a3a0dcb38f5871678
=======
ActiveRecord::Schema.define(version: 20170221095125) do
>>>>>>> f17a1a61bcce2edd4a1308fc386545eaabe674ca
=======
ActiveRecord::Schema.define(version: 20170222041528) do
>>>>>>> 8cd93c1dc2f650bc074f712dd3cc46a872928b97
=======
ActiveRecord::Schema.define(version: 20170224054340) do
>>>>>>> dd0258363226c1baed64ccbf2659618e87fe2cf7
=======
ActiveRecord::Schema.define(version: 20170225113548) do
>>>>>>> 11f1bc04b702e6ccefb4e148498b5a555c7084b2
=======
ActiveRecord::Schema.define(version: 20170328134723) do
>>>>>>> df024aea0bb6e2168247ac1316218d287ecd19bf
=======
ActiveRecord::Schema.define(version: 20170403140619) do
>>>>>>> 5e6c2c353d1473a5798fd5a078fe950ecb50bbc6
=======
ActiveRecord::Schema.define(version: 20170404114634) do
>>>>>>> c8a7a7ad7108efc54c0491b6383e5a3cbb6318ee
=======
ActiveRecord::Schema.define(version: 20170407022122) do
>>>>>>> c48d6f7546c2fb8a86e584ac61f4c1307d1c09e7

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

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD

=======
=======
=======
>>>>>>> c48d6f7546c2fb8a86e584ac61f4c1307d1c09e7
  create_table "all_likes", force: :cascade do |t|
    t.string   "lips_image",                 null: false
    t.string   "users_username",             null: false
    t.integer  "likes",          default: 0, null: false
    t.integer  "hates",          default: 0, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

<<<<<<< HEAD
>>>>>>> 11f1bc04b702e6ccefb4e148498b5a555c7084b2
=======
>>>>>>> c8a7a7ad7108efc54c0491b6383e5a3cbb6318ee
=======
>>>>>>> c48d6f7546c2fb8a86e584ac61f4c1307d1c09e7
  create_table "askfors", force: :cascade do |t|
    t.string   "brand",                   null: false
    t.string   "name",                    null: false
    t.string   "username",   default: "", null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end
>>>>>>> dd23e12dec804e9082952207ff701f3c6f9a845b

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

<<<<<<< HEAD

=======
>>>>>>> dd23e12dec804e9082952207ff701f3c6f9a845b
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
<<<<<<< HEAD
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
=======
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "status",       default: "요청"
>>>>>>> dd23e12dec804e9082952207ff701f3c6f9a845b
  end

  create_table "impressions", force: :cascade do |t|
    t.string   "impressionable_type"
    t.integer  "impressionable_id"
    t.integer  "user_id"
    t.string   "ip_address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
  create_table "lipdbs", force: :cascade do |t|
    t.string   "num"
<<<<<<< HEAD
=======
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
>>>>>>> a1756987233a3b897f92eecb7f60b35a6824525d
    t.string   "wc"
    t.string   "season"
    t.string   "tone"
    t.string   "brand"
    t.string   "name"
<<<<<<< HEAD
    t.integer  "price"
    t.string   "size"
    t.integer  "zzim",       default: 0
=======
    t.string   "price"
    t.string   "size"
    t.string   "color"
>>>>>>> a1756987233a3b897f92eecb7f60b35a6824525d
=======
=======
>>>>>>> f17a1a61bcce2edd4a1308fc386545eaabe674ca
  create_table "lips", force: :cascade do |t|
    t.string   "num"
    t.string   "image"
    t.string   "name"
    t.string   "brand"
    t.string   "level"
    t.string   "color"
    t.string   "wc"
    t.string   "tone_weak1",              default: " "
    t.string   "tone_weak2",              default: " "
    t.string   "tone_strong1",            default: " "
    t.string   "tone_strong2",            default: " "
    t.string   "season_1"
    t.string   "season_2"
    t.string   "price"
    t.string   "size"
<<<<<<< HEAD
>>>>>>> dd23e12dec804e9082952207ff701f3c6f9a845b
=======
>>>>>>> f17a1a61bcce2edd4a1308fc386545eaabe674ca
    t.string   "pro_type"
    t.string   "glitter"
    t.string   "texture"
    t.string   "keyword"
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    t.string   "image_url",  default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
=======
    t.string   "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
>>>>>>> a1756987233a3b897f92eecb7f60b35a6824525d
=======
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
>>>>>>> dd23e12dec804e9082952207ff701f3c6f9a845b
  end
=======
=======
>>>>>>> 8cd93c1dc2f650bc074f712dd3cc46a872928b97
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "cached_votes_total",      default: 0
    t.integer  "cached_votes_score",      default: 0
    t.integer  "cached_votes_up",         default: 0
    t.integer  "cached_votes_down",       default: 0
    t.integer  "cached_weighted_score",   default: 0
    t.integer  "cached_weighted_total",   default: 0
    t.float    "cached_weighted_average", default: 0.0
  end

  add_index "lips", ["cached_votes_down"], name: "index_lips_on_cached_votes_down"
  add_index "lips", ["cached_votes_score"], name: "index_lips_on_cached_votes_score"
  add_index "lips", ["cached_votes_total"], name: "index_lips_on_cached_votes_total"
  add_index "lips", ["cached_votes_up"], name: "index_lips_on_cached_votes_up"
  add_index "lips", ["cached_weighted_average"], name: "index_lips_on_cached_weighted_average"
  add_index "lips", ["cached_weighted_score"], name: "index_lips_on_cached_weighted_score"
  add_index "lips", ["cached_weighted_total"], name: "index_lips_on_cached_weighted_total"
<<<<<<< HEAD
>>>>>>> 1e743e9743d8a53f809af04c35898a2255ef3d1b

=======
>>>>>>> 7357919165088f27c151db0a3a0dcb38f5871678
=======
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
=======
>>>>>>> 8cd93c1dc2f650bc074f712dd3cc46a872928b97

>>>>>>> f17a1a61bcce2edd4a1308fc386545eaabe674ca
  create_table "notices", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

<<<<<<< HEAD
=======
  create_table "orders", force: :cascade do |t|
    t.string   "name"
    t.string   "tel"
    t.string   "address"
    t.string   "money_name"
    t.string   "product_brand"
    t.string   "product_name"
    t.integer  "product_price"
    t.integer  "product_number", default: 1
    t.string   "confirm",        default: "미확정"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

>>>>>>> dd23e12dec804e9082952207ff701f3c6f9a845b
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

  create_table "request_comments", force: :cascade do |t|
    t.text     "content"
    t.string   "nickname"
    t.integer  "request_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "request_replies", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.string   "nickname"
    t.integer  "request_id"
    t.integer  "group"
    t.integer  "level"
    t.string   "img_url",    default: ""
    t.integer  "hits"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "secret"
    t.string   "password"
  end

  create_table "requests", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.string   "nickname"
    t.integer  "group"
    t.integer  "level"
    t.string   "img_url",    default: ""
    t.integer  "hits"
    t.string   "secret"
    t.string   "password"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

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
    t.string   "name"
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
<<<<<<< HEAD
=======
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

ActiveRecord::Schema.define(version: 20170201075032) do

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

  create_table "askfors", force: :cascade do |t|
    t.string   "content"
    t.string   "status",     default: "요청"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

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
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "status",       default: "요청"
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
    t.string   "name"
    t.string   "brand"
    t.string   "level"
    t.string   "color"
    t.string   "wc"
    t.string   "tone"
    t.string   "season"
    t.string   "price"
    t.string   "size"
    t.string   "pro_type"
    t.string   "glitter"
    t.string   "texture"
    t.string   "keyword"
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

  create_table "orders", force: :cascade do |t|
    t.string   "name"
    t.string   "tel"
    t.string   "address"
    t.string   "money_name"
    t.string   "product_brand"
    t.string   "product_name"
    t.integer  "product_price"
    t.integer  "product_number", default: 1
    t.string   "confirm",        default: "미확정"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
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
>>>>>>> 051fe012d0c9e51fe33c085437421f9738d3ee14
=======
>>>>>>> dd23e12dec804e9082952207ff701f3c6f9a845b
