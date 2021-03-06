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

ActiveRecord::Schema.define(version: 2021_02_01_030303) do

  create_table "user_groups", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "workout_group_id", null: false
    t.integer "user_id", null: false
    t.string "mantra"
    t.index ["user_id"], name: "index_user_groups_on_user_id"
    t.index ["workout_group_id"], name: "index_user_groups_on_workout_group_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "workout_groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "workouts", force: :cascade do |t|
    t.string "name"
    t.integer "sets"
    t.integer "reps"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "workout_group_id", null: false
    t.index ["workout_group_id"], name: "index_workouts_on_workout_group_id"
  end

  add_foreign_key "user_groups", "users"
  add_foreign_key "user_groups", "workout_groups"
  add_foreign_key "workouts", "workout_groups"
end
