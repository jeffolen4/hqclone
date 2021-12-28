# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_12_27_184451) do

  create_table "answers", id: { type: :bigint, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.bigint "question_id"
    t.string "answer_verbiage"
    t.boolean "correct_answer"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "asked_questions", id: { type: :bigint, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.bigint "game_id"
    t.bigint "question_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_asked_questions_on_game_id"
    t.index ["question_id"], name: "index_asked_questions_on_question_id"
  end

  create_table "games", id: { type: :bigint, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.integer "players_all", unsigned: true
    t.integer "players_left", unsigned: true
    t.bigint "questions_asked", unsigned: true
    t.integer "current_state"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "players", id: { type: :bigint, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.string "player_name"
    t.string "player_email"
    t.bigint "active_game"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "questions", id: { type: :bigint, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.string "question_verbiage"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", id: { type: :integer, unsigned: true }, charset: "utf8mb3", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
