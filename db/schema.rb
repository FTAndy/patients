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

ActiveRecord::Schema.define(version: 20160830094826) do

  create_table "locations", force: :cascade do |t|
    t.string "code", limit: 10, null: false
    t.string "name", limit: 80
  end

  create_table "patients", force: :cascade do |t|
    t.string  "first_name",    limit: 30,                 null: false
    t.string  "middle_name",   limit: 10
    t.string  "last_name",     limit: 30,                 null: false
    t.date    "date_of_birth"
    t.string  "gender"
    t.string  "status",                                   null: false
    t.integer "viewed_count",             default: 0
    t.integer "location_id",              default: 1,     null: false
    t.boolean "deleted",                  default: false
  end

end
