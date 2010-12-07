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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101206063323) do

  create_table "announces", :force => true do |t|
    t.string   "name"
    t.string   "cache_slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "announces_translations", :force => true do |t|
    t.integer  "announce_id"
    t.integer  "announces_type_id"
    t.integer  "language_id"
    t.string   "title"
    t.text     "content"
    t.float    "latitude"
    t.float    "longtitude"
    t.date     "start_on"
    t.date     "stop_on"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "task_id"
    t.boolean  "publish"
  end

  create_table "announces_types", :force => true do |t|
    t.string   "name"
    t.string   "cache_slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                                 :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 25
    t.string   "guid",              :limit => 10
    t.integer  "locale",            :limit => 1,  :default => 0
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "fk_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_assetable_type"
  add_index "ckeditor_assets", ["user_id"], :name => "fk_user"

  create_table "events", :force => true do |t|
    t.string   "name"
    t.string   "cache_slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events_translations", :force => true do |t|
    t.integer  "event_id"
    t.integer  "events_type_id"
    t.integer  "language_id"
    t.string   "title"
    t.text     "content"
    t.float    "latitude"
    t.float    "longtitude"
    t.date     "start_on"
    t.date     "stop_on"
    t.integer  "user_id"
    t.boolean  "publish"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events_types", :force => true do |t|
    t.string   "name"
    t.string   "cache_slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "languages", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "newsletters", :force => true do |t|
    t.string   "name"
    t.string   "cache_slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "newsletters_translations", :force => true do |t|
    t.integer  "newsletter_id"
    t.integer  "newsletters_type_id"
    t.integer  "language_id"
    t.string   "title"
    t.text     "content"
    t.float    "latitude"
    t.float    "longtitude"
    t.date     "start_on"
    t.date     "stop_on"
    t.integer  "user_id"
    t.boolean  "publish"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "newsletters_types", :force => true do |t|
    t.string   "name"
    t.string   "cache_slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", :force => true do |t|
    t.string   "name"
    t.string   "cached_slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages_translations", :force => true do |t|
    t.integer  "page_id"
    t.integer  "language_id"
    t.string   "title"
    t.text     "content"
    t.boolean  "publish"
    t.date     "start_on"
    t.date     "stop_on"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", :force => true do |t|
    t.integer  "user_id"
    t.integer  "company_id"
    t.string   "name"
    t.string   "surname"
    t.string   "position"
    t.string   "telephone"
    t.string   "mobile"
    t.integer  "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "progresses", :force => true do |t|
    t.string   "month"
    t.float    "schedule"
    t.float    "actual"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "issuedate"
  end

  create_table "purple_asset_resources", :force => true do |t|
    t.string   "caption"
    t.integer  "purple_asset_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "resource_file_name"
    t.string   "resource_content_type"
    t.integer  "resource_file_size"
    t.datetime "resource_updated_at"
  end

  create_table "purple_assets", :force => true do |t|
    t.string   "title"
    t.string   "type"
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.boolean  "publish"
    t.float    "latitude"
    t.float    "longtitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "slugs", :force => true do |t|
    t.string   "name"
    t.integer  "sluggable_id"
    t.integer  "sequence",                     :default => 1, :null => false
    t.string   "sluggable_type", :limit => 40
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "slugs", ["name", "sluggable_type", "sequence", "scope"], :name => "index_slugs_on_n_s_s_and_s", :unique => true
  add_index "slugs", ["sluggable_id"], :name => "index_slugs_on_sluggable_id"

  create_table "stations", :force => true do |t|
    t.string   "name"
    t.string   "cached_slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stations_translations", :force => true do |t|
    t.integer  "station_id"
    t.integer  "language_id"
    t.string   "title"
    t.text     "content"
    t.float    "latitude"
    t.float    "longtitude"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "code"
  end

  create_table "tasks", :force => true do |t|
    t.string   "name"
    t.string   "cached_slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks_translations", :force => true do |t|
    t.integer  "task_id"
    t.integer  "language_id"
    t.integer  "station_id"
    t.string   "title"
    t.text     "content"
    t.boolean  "publish"
    t.date     "start_on"
    t.date     "stop_on"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "latitude"
    t.float    "longtitude"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer  "failed_attempts",                     :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true

end
