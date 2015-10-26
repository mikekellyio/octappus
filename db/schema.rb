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

ActiveRecord::Schema.define(version: 20151020233220) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "associated_steps", force: :cascade do |t|
    t.integer  "child_id"
    t.integer  "step_id"
    t.datetime "award_received_at"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "associated_steps", ["child_id"], name: "index_associated_steps_on_child_id", using: :btree
  add_index "associated_steps", ["step_id"], name: "index_associated_steps_on_step_id", using: :btree

  create_table "awards", force: :cascade do |t|
    t.string   "name"
    t.integer  "step_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "awards_children", force: :cascade do |t|
    t.integer  "child_id"
    t.integer  "award_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "awards_children", ["award_id"], name: "index_awards_children_on_award_id", using: :btree
  add_index "awards_children", ["child_id"], name: "index_awards_children_on_child_id", using: :btree

  create_table "books", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "children", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "nickname"
    t.date     "birthday"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "team_id"
    t.string   "avatar_hash"
  end

  add_index "children", ["team_id"], name: "index_children_on_team_id", using: :btree

  create_table "organizations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "steps", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "parent_id"
    t.integer  "lft",                        null: false
    t.integer  "rgt",                        null: false
    t.integer  "depth",          default: 0, null: false
    t.integer  "children_count", default: 0, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "steps", ["lft"], name: "index_steps_on_lft", using: :btree
  add_index "steps", ["parent_id"], name: "index_steps_on_parent_id", using: :btree
  add_index "steps", ["rgt"], name: "index_steps_on_rgt", using: :btree

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "organization_id"
  end

end
