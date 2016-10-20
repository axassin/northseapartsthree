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

ActiveRecord::Schema.define(version: 20161017103832) do

  create_table "contact_details", id: :string, limit: 36, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "label",             limit: 64
    t.string   "system_account_id", limit: 36
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "links", id: :string, limit: 36, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "service",           limit: 64
    t.string   "url",               limit: 512
    t.string   "contact_detail_id", limit: 36
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remark",            limit: 64
  end

  create_table "locations", id: :string, limit: 36, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "longitude",         limit: 256
    t.string   "latitude",          limit: 256
    t.string   "address",           limit: 512
    t.string   "contact_detail_id", limit: 36
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "system_accounts", id: :string, limit: 36, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",          limit: 64
    t.string   "description",   limit: 512
    t.string   "account_type",  limit: 64
    t.string   "primary_image", limit: 512
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "telephone_numbers", id: :string, limit: 36, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "digits",            limit: 64
    t.string   "contact_detail_id", limit: 36
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remark",            limit: 64
  end

  create_table "vehicles", id: :string, limit: 36, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "color",                limit: 64
    t.string   "make",                 limit: 64
    t.string   "brand",                limit: 64
    t.string   "plate_number",         limit: 64
    t.string   "fuel_type",            limit: 64
    t.string   "description",          limit: 512
    t.date     "date_of_registration"
    t.string   "primary_image",        limit: 512
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
