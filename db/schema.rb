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

ActiveRecord::Schema.define(version: 20150901042636) do

  create_table "attachments", force: :cascade do |t|
    t.integer "user_id"
    t.string  "file_name"
    t.text    "file_description"
    t.string  "file_type"
  end

  add_index "attachments", ["user_id"], name: "index_attachments_on_user_id"

  create_table "class_styles", force: :cascade do |t|
    t.integer "user_id"
    t.string  "user_type"
    t.boolean "instant_messaging"
    t.boolean "video_conferencing"
    t.boolean "screen_sharing"
    t.boolean "file_sharing"
    t.boolean "audio"
  end

  add_index "class_styles", ["user_id"], name: "index_class_styles_on_user_id"

  create_table "class_types", force: :cascade do |t|
    t.integer "user_id"
    t.string  "user_type"
    t.boolean "one_one"
    t.boolean "one_many"
    t.boolean "many_one"
    t.boolean "institute"
    t.boolean "many_many"
  end

  add_index "class_types", ["user_id"], name: "index_class_types_on_user_id"

  create_table "counselors", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "counselors", ["user_id"], name: "index_counselors_on_user_id"

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.float    "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "courses", ["user_id"], name: "index_courses_on_user_id"

  create_table "days_availables", force: :cascade do |t|
    t.integer "user_id"
    t.string  "user_type"
    t.boolean "monday_available"
    t.boolean "tuesday_available"
    t.boolean "wednesday_available"
    t.boolean "thursday_available"
    t.boolean "friday_available"
    t.boolean "saturday_available"
    t.boolean "sunday_available"
  end

  add_index "days_availables", ["user_id"], name: "index_days_availables_on_user_id"

  create_table "entrepreneurs", force: :cascade do |t|
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "user_id"
    t.string   "desired_role"
    t.text     "institute_description"
    t.text     "experience_description"
    t.text     "institute_policies_interests"
  end

  add_index "entrepreneurs", ["user_id"], name: "index_entrepreneurs_on_user_id"

  create_table "institutes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "links", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.string   "link_content"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "links", ["user_id"], name: "index_links_on_user_id"

  create_table "profile_policies", force: :cascade do |t|
    t.integer "user_id"
    t.string  "user_type"
    t.boolean "class_preferences"
    t.boolean "profile_details"
    t.boolean "files_uploaded"
    t.boolean "class_enrolled"
    t.boolean "schedule"
    t.string  "user_set"
    t.boolean "student_groups"
  end

  add_index "profile_policies", ["user_id"], name: "index_profile_policies_on_user_id"

  create_table "student_group_members", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "student_group_id"
    t.string   "role"
    t.text     "role_description"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "student_group_members", ["student_group_id"], name: "index_student_group_members_on_student_group_id"
  add_index "student_group_members", ["user_id"], name: "index_student_group_members_on_user_id"

  create_table "student_groups", force: :cascade do |t|
    t.string   "name"
    t.string   "preferred_size"
    t.text     "expectations_description"
    t.string   "price_range"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "students", force: :cascade do |t|
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "user_id"
    t.text     "self_description"
    t.datetime "available_start_date"
    t.string   "course_type"
    t.string   "profile_visible"
    t.boolean  "counselor_interest"
  end

  add_index "students", ["user_id"], name: "index_students_on_user_id"

  create_table "teachers", force: :cascade do |t|
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "user_id"
    t.text     "hire_description"
    t.string   "course_type"
    t.string   "price_negotiation"
  end

  add_index "teachers", ["user_id"], name: "index_teachers_on_user_id"

  create_table "users", force: :cascade do |t|
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "username"
    t.string   "name"
    t.integer  "is_active"
    t.string   "avatar"
    t.string   "gender"
    t.datetime "birthday"
    t.text     "skill_description"
    t.string   "education_level"
    t.string   "degree"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true

  create_table "users_interests", force: :cascade do |t|
    t.string  "subject"
    t.string  "user_type"
    t.integer "user_id"
    t.string  "competency"
  end

  add_index "users_interests", ["user_id"], name: "index_users_interests_on_user_id"

  create_table "users_time_slots", force: :cascade do |t|
    t.string   "user_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string   "user_type"
    t.boolean  "available"
  end

  add_index "users_time_slots", ["user_id"], name: "index_users_time_slots_on_user_id"

end
