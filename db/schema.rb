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

ActiveRecord::Schema.define(version: 20201024042208) do

  create_table "attendances", force: :cascade do |t|
    t.date "worked_on"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.string "note"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "lesson_status_00", default: 0
    t.integer "lesson_status_01", default: 0
    t.integer "lesson_status_02", default: 0
    t.integer "lesson_status_03", default: 0
    t.integer "lesson_status_04", default: 0
    t.integer "lesson_status_05", default: 0
    t.integer "lesson_status_06", default: 0
    t.integer "lesson_status_07", default: 0
    t.integer "lesson_status_08", default: 0
    t.integer "lesson_status_09", default: 0
    t.integer "lesson_status_10", default: 0
    t.integer "lesson_status_11", default: 0
    t.integer "lesson_status_12", default: 0
    t.integer "lesson_status_13", default: 0
    t.integer "lesson_status_14", default: 0
    t.integer "lesson_status_15", default: 0
    t.integer "lesson_status_16", default: 0
    t.integer "lesson_status_17", default: 0
    t.integer "lesson_status_18", default: 0
    t.integer "lesson_status_19", default: 0
    t.integer "lesson_status_20", default: 0
    t.integer "lesson_status_21", default: 0
    t.integer "lesson_status_22", default: 0
    t.integer "lesson_status_23", default: 0
    t.integer "lesson_00_parent_id"
    t.integer "lesson_01_parent_id"
    t.integer "lesson_02_parent_id"
    t.integer "lesson_03_parent_id"
    t.integer "lesson_04_parent_id"
    t.integer "lesson_05_parent_id"
    t.integer "lesson_06_parent_id"
    t.integer "lesson_07_parent_id"
    t.integer "lesson_08_parent_id"
    t.integer "lesson_09_parent_id"
    t.integer "lesson_10_parent_id"
    t.integer "lesson_11_parent_id"
    t.integer "lesson_12_parent_id"
    t.integer "lesson_13_parent_id"
    t.integer "lesson_14_parent_id"
    t.integer "lesson_15_parent_id"
    t.integer "lesson_16_parent_id"
    t.integer "lesson_17_parent_id"
    t.integer "lesson_18_parent_id"
    t.integer "lesson_19_parent_id"
    t.integer "lesson_20_parent_id"
    t.integer "lesson_21_parent_id"
    t.integer "lesson_22_parent_id"
    t.integer "lesson_23_parent_id"
    t.string "tutor_checker_0"
    t.string "tutor_checker_1"
    t.string "tutor_checker_2"
    t.string "tutor_checker_3"
    t.string "tutor_checker_4"
    t.string "tutor_checker_5"
    t.string "tutor_checker_6"
    t.string "tutor_checker_7"
    t.string "tutor_checker_8"
    t.string "tutor_checker_9"
    t.string "tutor_checker_10"
    t.string "tutor_checker_11"
    t.string "tutor_checker_12"
    t.string "tutor_checker_13"
    t.string "tutor_checker_14"
    t.string "tutor_checker_15"
    t.string "tutor_checker_16"
    t.string "tutor_checker_17"
    t.string "tutor_checker_18"
    t.string "tutor_checker_19"
    t.string "tutor_checker_20"
    t.string "tutor_checker_21"
    t.string "tutor_checker_22"
    t.string "tutor_checker_23"
    t.index ["user_id"], name: "index_attendances_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin", default: false
    t.string "department"
    t.datetime "basic_time", default: "2020-10-27 23:00:00"
    t.datetime "work_time", default: "2020-10-27 22:30:00"
    t.boolean "tutor", default: false
    t.boolean "parent", default: false
    t.string "favorite_subject"
    t.string "self_introduction"
    t.string "image"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
