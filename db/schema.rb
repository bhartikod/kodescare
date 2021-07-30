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

ActiveRecord::Schema.define(version: 20210316191839) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "general_informations", force: :cascade do |t|
    t.string "course"
    t.string "attend"
    t.string "class_type"
    t.datetime "dob"
    t.string "gender"
    t.string "graduation_year"
    t.string "full_time_work"
    t.string "how_hear"
    t.string "is_laptop"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "options", force: :cascade do |t|
    t.bigint "question_id"
    t.string "value"
    t.boolean "correct_option", default: false
    t.integer "question_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_options_on_question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "title"
    t.boolean "active_question", default: false
    t.integer "question_type"
    t.integer "level_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subscribers", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tests", force: :cascade do |t|
    t.bigint "user_id"
    t.string "status"
    t.datetime "time_duration"
    t.string "correct_answers"
    t.datetime "final_submission_time"
    t.decimal "overall_score"
    t.string "next_test"
    t.string "test_given_on"
    t.string "sample_questions", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tests_on_user_id"
  end

  create_table "user_answers", force: :cascade do |t|
    t.bigint "test_id"
    t.bigint "question_id"
    t.bigint "option_id"
    t.string "text_content"
    t.boolean "correct_answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["option_id"], name: "index_user_answers_on_option_id"
    t.index ["question_id"], name: "index_user_answers_on_question_id"
    t.index ["test_id"], name: "index_user_answers_on_test_id"
  end

  create_table "users", force: :cascade do |t|
    t.bigint "general_information_id"
    t.string "email", default: "", null: false
    t.string "name"
    t.string "select_id_proof"
    t.string "enter_id_number"
    t.string "document_link"
    t.bigint "contact_num"
    t.integer "verification_code"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["general_information_id"], name: "index_users_on_general_information_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "visitors", force: :cascade do |t|
    t.string "ip_address"
    t.string "temp_email"
    t.integer "visits", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "options", "questions"
  add_foreign_key "tests", "users"
  add_foreign_key "user_answers", "options"
  add_foreign_key "user_answers", "questions"
  add_foreign_key "user_answers", "tests"
  add_foreign_key "users", "general_informations"
end
