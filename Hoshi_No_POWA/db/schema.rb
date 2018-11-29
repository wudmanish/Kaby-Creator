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

ActiveRecord::Schema.define(version: 2018_11_28_044704) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "Po", force: :cascade do |t|
    t.string "Bomb"
    t.string "Cutter"
    t.string "Burn"
    t.string "Ice"
    t.string "Needle"
    t.string "Spark"
    t.string "Stone"
  end

  create_table "Twice", force: :cascade do |t|
    t.string "Bomb"
    t.string "Cutter"
    t.string "Burn"
    t.string "Ice"
    t.string "Needle"
    t.string "Spark"
    t.string "Stone"
  end

  create_table "kirb", force: :cascade do |t|
    t.string "Crystal"
    t.string "Dreamland"
    t.string "Superstar"
  end

  create_table "users", force: :cascade do |t|
    t.string "first"
    t.string "last"
    t.string "displayname"
    t.string "email"
    t.string "password"
    t.string "screenname"
  end

end
