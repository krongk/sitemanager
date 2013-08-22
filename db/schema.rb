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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130822144634) do

  create_table "keystores", :id => false, :force => true do |t|
    t.string   "key",        :limit => 50, :default => "", :null => false
    t.integer  "value",      :limit => 8
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  add_index "keystores", ["key"], :name => "key", :unique => true

  create_table "mail_items", :force => true do |t|
    t.integer  "user_id",                       :null => false
    t.string   "email",                         :null => false
    t.string   "name"
    t.string   "source_name"
    t.string   "city"
    t.string   "area"
    t.text     "description"
    t.text     "note"
    t.string   "is_processed", :default => "n", :null => false
    t.integer  "send_count",   :default => 0
    t.integer  "account_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "mail_items", ["city"], :name => "index_mail_items_on_city"
  add_index "mail_items", ["source_name"], :name => "index_mail_items_on_source_name"
  add_index "mail_items", ["user_id", "email"], :name => "index_mail_items_on_user_id_and_email", :unique => true
  add_index "mail_items", ["user_id"], :name => "index_mail_items_on_user_id"

  create_table "mail_tmps", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "mail_tmps", ["user_id"], :name => "index_mail_tmps_on_user_id"

  create_table "phone_items", :force => true do |t|
    t.integer  "user_id"
    t.string   "mobile"
    t.string   "name"
    t.string   "source_name"
    t.string   "city"
    t.string   "area"
    t.text     "description"
    t.text     "note"
    t.string   "is_processed", :default => "n"
    t.integer  "send_count",   :default => 0
    t.integer  "customer_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "phone_items", ["city"], :name => "index_phone_items_on_city"
  add_index "phone_items", ["source_name"], :name => "index_phone_items_on_source_name"
  add_index "phone_items", ["user_id", "mobile"], :name => "index_phone_items_on_user_id_and_mobile", :unique => true
  add_index "phone_items", ["user_id"], :name => "index_phone_items_on_user_id"

  create_table "resource_items", :force => true do |t|
    t.string   "resource_type", :limit => 32
    t.string   "resource_name"
    t.string   "resource_path"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "sites", :force => true do |t|
    t.integer  "user_id",                                        :null => false
    t.string   "site_name",    :limit => 32,                     :null => false
    t.string   "site_title",   :limit => 128,                    :null => false
    t.string   "domain",       :limit => 128
    t.integer  "theme_id"
    t.text     "head"
    t.text     "header"
    t.text     "body"
    t.text     "footer"
    t.boolean  "is_published",                :default => false
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
  end

  add_index "sites", ["site_name"], :name => "index_sites_on_site_name", :unique => true
  add_index "sites", ["user_id"], :name => "index_sites_on_user_id"

  create_table "sms_logs", :force => true do |t|
    t.integer  "user_id"
    t.integer  "sms_tmp_id"
    t.string   "resource"
    t.integer  "resource_id"
    t.integer  "status"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "sms_logs", ["resource", "resource_id"], :name => "index_sms_logs_on_resource_and_resource_id"
  add_index "sms_logs", ["sms_tmp_id"], :name => "index_sms_logs_on_sms_tmp_id"
  add_index "sms_logs", ["status"], :name => "index_sms_logs_on_status"
  add_index "sms_logs", ["user_id"], :name => "index_sms_logs_on_user_id"

  create_table "sms_tmps", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sms_tmps", ["user_id"], :name => "index_sms_tmps_on_user_id"

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "themes", :force => true do |t|
    t.string   "name",        :limit => 64,                :null => false
    t.string   "tags"
    t.integer  "share_count",               :default => 1
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  add_index "themes", ["name"], :name => "index_themes_on_name", :unique => true

  create_table "user_details", :force => true do |t|
    t.integer  "user_id",                           :null => false
    t.string   "contact_name",        :limit => 32
    t.string   "id_card"
    t.string   "mobile_phone",        :limit => 16
    t.string   "tel_phone"
    t.string   "qq",                  :limit => 16
    t.string   "email",               :limit => 32
    t.string   "website"
    t.string   "region"
    t.string   "city"
    t.string   "district"
    t.string   "address"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "company_name"
    t.string   "company_nickname"
    t.string   "corporator"
    t.string   "company_reg_no"
    t.string   "company_reg_code"
    t.text     "company_description"
    t.string   "company_keywords"
    t.string   "fu_gmail_name",       :limit => 32
    t.string   "fu_gmail_pwd",        :limit => 32
    t.string   "fu_qmail_name",       :limit => 32
    t.string   "fu_qmail_pwd",        :limit => 32
    t.string   "fu_user_name",        :limit => 32
    t.string   "fu_user_pwd",         :limit => 32
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_details", ["mobile_phone"], :name => "index_user_details_on_mobile_phone"
  add_index "user_details", ["user_id"], :name => "index_user_details_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

end
