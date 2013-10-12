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

ActiveRecord::Schema.define(:version => 20130926034043) do

  create_table "accounts", :force => true do |t|
    t.string   "student_no"
    t.string   "school_name"
    t.string   "username"
    t.string   "hashed_password"
    t.string   "salt"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "role_id"
  end

  create_table "admins", :force => true do |t|
    t.string   "first_name",      :limit => 25
    t.string   "last_name",       :limit => 50
    t.string   "username",        :limit => 25
    t.string   "email",           :limit => 100, :null => false
    t.string   "hashed_password", :limit => 100
    t.string   "salt",            :limit => 40
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "articles", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "synopsis",     :limit => 1000
    t.text     "body",         :limit => 2000
    t.boolean  "published",                    :default => false
    t.datetime "published_at"
    t.integer  "category_id",                  :default => 1
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
  end

  create_table "caricullums", :force => true do |t|
    t.string   "caricullumname"
    t.string   "description"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "notes", :force => true do |t|
    t.string   "title"
    t.string   "subject"
    t.string   "academic_class"
    t.string   "app_file_name"
    t.integer  "app_file_size"
    t.string   "app_content_type"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "permissions", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "roles", ["title"], :name => "index_roles_on_title", :unique => true

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "schools", :force => true do |t|
    t.string   "schoolname"
    t.string   "address"
    t.string   "headteacher"
    t.string   "contact"
    t.string   "user"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "students", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "student_number"
    t.string   "parent_name"
    t.string   "phone_number"
    t.string   "address"
    t.string   "student_school"
    t.string   "student_class"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "role_id"
  end

  create_table "subjects", :force => true do |t|
    t.string   "subjectname"
    t.string   "subjectlevel"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "teachers", :force => true do |t|
    t.integer  "school_id"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.string   "phone_number"
    t.string   "address"
    t.string   "school"
    t.string   "subject"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "role_id"
  end

  add_index "teachers", ["school_id"], :name => "index_teachers_on_school_id"

  create_table "unebs", :force => true do |t|
    t.date     "academic_year"
    t.string   "subject"
    t.string   "academic_level"
    t.string   "app_file_name"
    t.integer  "app_file_size"
    t.string   "app_content_type"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.string   "phone_number"
    t.string   "username"
    t.string   "hashed_password"
    t.string   "salt"
    t.string   "role_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
