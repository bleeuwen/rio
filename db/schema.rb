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

ActiveRecord::Schema.define(version: 20131105104531) do

  create_table "artikelgroeps", force: true do |t|
    t.string   "groepcode"
    t.string   "omschrijving"
    t.string   "opmerking"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "artikels", force: true do |t|
    t.string   "artikelnummer"
    t.string   "omschrijving"
    t.decimal  "prijs",           precision: 9, scale: 2
    t.string   "opmerking"
    t.integer  "artikelgroep_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "artikels", ["artikelgroep_id"], name: "index_artikels_on_artikelgroep_id", using: :btree

  create_table "order_regels", force: true do |t|
    t.integer  "order_id"
    t.integer  "artikel_id"
    t.integer  "aantal"
    t.string   "opmerking"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.integer  "user_id"
    t.string   "ordernr"
    t.string   "opmerking"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_artikelgroeps", force: true do |t|
    t.integer  "user_id"
    t.integer  "artikelgroep_id"
    t.boolean  "auth_c"
    t.boolean  "auth_r"
    t.boolean  "auth_u"
    t.boolean  "auth_d"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_artikelgroeps", ["artikelgroep_id"], name: "index_user_artikelgroeps_on_artikelgroep_id", using: :btree
  add_index "user_artikelgroeps", ["user_id"], name: "index_user_artikelgroeps_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
