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

ActiveRecord::Schema.define(:version => 20130818202724) do

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
    t.integer  "role_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
