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

ActiveRecord::Schema.define(version: 2019_01_29_224256) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boards", force: :cascade do |t|
    t.integer "rows"
    t.integer "cols"
    t.integer "mines_percentage"
    t.bigint "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_boards_on_game_id"
  end

  create_table "cells", force: :cascade do |t|
    t.integer "x"
    t.integer "y"
    t.bigint "board_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "kind"
    t.boolean "played", default: false
    t.integer "mines_neighbors"
    t.index ["board_id"], name: "index_cells_on_board_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "player"
    t.boolean "over", default: false
    t.boolean "won", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plays", force: :cascade do |t|
    t.integer "x"
    t.integer "y"
    t.bigint "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_plays_on_game_id"
  end

  add_foreign_key "boards", "games"
  add_foreign_key "cells", "boards"
  add_foreign_key "plays", "games"
end
