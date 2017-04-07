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

ActiveRecord::Schema.define(version: 20170312143150) do

  create_table "associated_files", id: :string, limit: 36, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description",   limit: 512
    t.string   "name",          limit: 128
    t.string   "file",          limit: 512
    t.string   "fileable_id",   limit: 36
    t.string   "fileable_type"
    t.index ["deleted_at"], name: "index_associated_files_on_deleted_at", using: :btree
  end

  create_table "associated_images", id: :string, limit: 36, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description",    limit: 512
    t.string   "name",           limit: 128
    t.string   "image",          limit: 512
    t.string   "imageable_id",   limit: 36
    t.string   "imageable_type"
    t.index ["deleted_at"], name: "index_associated_images_on_deleted_at", using: :btree
  end

  create_table "attendance_records", id: :string, limit: 36, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "employee_id",    limit: 36
    t.string   "remark",         limit: 256
    t.date     "implemented_on"
    t.time     "time_in"
    t.time     "time_out"
    t.index ["deleted_at"], name: "index_attendance_records_on_deleted_at", using: :btree
  end

  create_table "bank_accounts", id: :string, limit: 36, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "system_account_id", limit: 36
    t.string   "bank_id",           limit: 36
    t.string   "account_number",    limit: 64
    t.string   "remark",            limit: 256
    t.index ["deleted_at"], name: "index_bank_accounts_on_deleted_at", using: :btree
  end

  create_table "bank_transfers", id: :string, limit: 36, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "transaction_number",          limit: 36
    t.string   "to_bank_account_number_id",   limit: 36
    t.string   "from_bank_account_number_id", limit: 36
    t.string   "exchange_medium_id",          limit: 36
    t.index ["deleted_at"], name: "index_bank_transfers_on_deleted_at", using: :btree
  end

  create_table "banks", id: :string, limit: 36, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "system_account_id", limit: 36
    t.string   "remark",            limit: 256
    t.index ["deleted_at"], name: "index_banks_on_deleted_at", using: :btree
  end

  create_table "biodata", id: :string, limit: 36, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "employee_id",            limit: 36
    t.string   "name_of_mother",         limit: 256
    t.string   "name_of_father",         limit: 256
    t.string   "dependents",             limit: 256
    t.string   "complexion",             limit: 64
    t.string   "height",                 limit: 64
    t.string   "sex",                    limit: 64
    t.string   "blood_type",             limit: 64
    t.date     "date_of_birth"
    t.string   "education",              limit: 256
    t.string   "experience",             limit: 256
    t.string   "notable_accomplishment", limit: 256
    t.string   "description",            limit: 512
    t.index ["date_of_birth"], name: "index_biodata_on_date_of_birth", using: :btree
    t.index ["deleted_at"], name: "index_biodata_on_deleted_at", using: :btree
  end

  create_table "branches", id: :string, limit: 36, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",        limit: 128
    t.string   "description", limit: 512
    t.index ["deleted_at"], name: "index_branches_on_deleted_at", using: :btree
  end

  create_table "cashes", id: :string, limit: 36, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "denomination"
    t.string   "reference_number"
    t.string   "exchange_medium_id", limit: 36
    t.index ["deleted_at"], name: "index_cashes_on_deleted_at", using: :btree
  end

  create_table "checks", id: :string, limit: 36, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "bank_account_id",    limit: 36
    t.string   "check_number",       limit: 36
    t.date     "dated"
    t.string   "signatory",          limit: 36
    t.string   "payee",              limit: 36
    t.string   "exchange_medium_id", limit: 36
    t.index ["deleted_at"], name: "index_checks_on_deleted_at", using: :btree
  end

  create_table "contact_details", id: :string, limit: 36, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "label",            limit: 64
    t.string   "contactable_id",   limit: 36
    t.string   "contactable_type"
    t.index ["contactable_type", "contactable_id"], name: "index_contact_details_on_contactable_type_and_contactable_id", using: :btree
    t.index ["deleted_at"], name: "index_contact_details_on_deleted_at", using: :btree
  end

  create_table "day_schemes", id: :string, limit: 36, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type_name",                    limit: 64
    t.float    "base_multiplier",              limit: 24
    t.float    "overtime_multiplier",          limit: 24
    t.float    "rest_day_multiplier",          limit: 24
    t.float    "overtime_rest_day_multiplier", limit: 24
    t.date     "implemented_on"
    t.string   "remark",                       limit: 256
    t.index ["deleted_at"], name: "index_day_schemes_on_deleted_at", using: :btree
  end

  create_table "employee_statuses", id: :string, limit: 36, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "employee_id",    limit: 36
    t.date     "implemented_on"
    t.string   "remark",         limit: 256
    t.string   "state",          limit: 64
    t.index ["deleted_at"], name: "index_employee_statuses_on_deleted_at", using: :btree
  end

  create_table "employees", id: :string, limit: 36, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "system_account_id", limit: 36
    t.string   "branch_id",         limit: 36
    t.string   "position",          limit: 64
    t.index ["deleted_at"], name: "index_employees_on_deleted_at", using: :btree
  end

  create_table "exchange_media", id: :string, limit: 36, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "amount_centavos",              default: 0,     null: false
    t.string   "amount_currency",              default: "PHP", null: false
    t.string   "remark",           limit: 256
    t.datetime "implemented_at"
    t.string   "transaction_type"
    t.integer  "transaction_id"
    t.index ["deleted_at"], name: "index_exchange_media_on_deleted_at", using: :btree
    t.index ["transaction_type", "transaction_id"], name: "index_exchange_media_on_transaction_type_and_transaction_id", using: :btree
  end

  create_table "expense_assignments", id: :string, limit: 36, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "expense_entry_id", limit: 36
    t.string   "expensable_id",    limit: 36
    t.string   "expensable_type"
    t.string   "remark",           limit: 256
    t.index ["deleted_at"], name: "index_expense_assignments_on_deleted_at", using: :btree
    t.index ["expensable_type", "expensable_id"], name: "index_expense_assignments_on_expensable_type_and_expensable_id", using: :btree
  end

  create_table "expense_categories", id: :string, limit: 36, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",       limit: 128
    t.string   "remark",     limit: 256
    t.string   "ancestry"
    t.index ["ancestry"], name: "index_expense_categories_on_ancestry", using: :btree
    t.index ["deleted_at"], name: "index_expense_categories_on_deleted_at", using: :btree
  end

  create_table "expense_entries", id: :string, limit: 36, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "vendor_id",           limit: 36
    t.string   "expense_category_id", limit: 36
    t.date     "due_date"
    t.string   "receiving_party_id",  limit: 36
    t.string   "reference_number"
    t.integer  "amount_centavos",                 default: 0,     null: false
    t.string   "amount_currency",                 default: "PHP", null: false
    t.string   "remark",              limit: 256
    t.index ["deleted_at"], name: "index_expense_entries_on_deleted_at", using: :btree
  end

  create_table "greco_items", id: :string, limit: 36, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",       limit: 128
    t.string   "remark",     limit: 256
    t.index ["deleted_at"], name: "index_greco_items_on_deleted_at", using: :btree
  end

  create_table "greco_transactions", id: :string, limit: 36, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "greco_item_id",    limit: 36
    t.integer  "quantity"
    t.string   "transaction_code", limit: 64
    t.string   "transaction_type", limit: 64
    t.date     "implemented_on"
    t.string   "remark",           limit: 256
    t.index ["deleted_at"], name: "index_greco_transactions_on_deleted_at", using: :btree
  end

  create_table "holidays", id: :string, limit: 36, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remark",         limit: 256
    t.date     "implemented_on"
    t.string   "name",           limit: 128
    t.string   "day_scheme_id",  limit: 128
    t.index ["deleted_at"], name: "index_holidays_on_deleted_at", using: :btree
  end

  create_table "links", id: :string, limit: 36, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "service",           limit: 64
    t.string   "url",               limit: 512
    t.string   "contact_detail_id", limit: 36
    t.string   "remark",            limit: 256
    t.index ["deleted_at"], name: "index_links_on_deleted_at", using: :btree
  end

  create_table "locations", id: :string, limit: 36, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "longitude",         limit: 256
    t.string   "latitude",          limit: 256
    t.string   "address",           limit: 512
    t.string   "contact_detail_id", limit: 36
    t.index ["deleted_at"], name: "index_locations_on_deleted_at", using: :btree
  end

  create_table "payments", id: :string, limit: 36, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "system_account_id",  limit: 36
    t.string   "exchange_medium_id", limit: 36
    t.string   "remark",             limit: 256
    t.index ["deleted_at"], name: "index_payments_on_deleted_at", using: :btree
  end

  create_table "regular_work_periods", id: :string, limit: 36, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "employee_id",    limit: 36
    t.string   "remark",         limit: 256
    t.date     "implemented_on"
    t.boolean  "one_hour_break",             default: true
    t.time     "time_in",                    default: '2000-01-01 08:00:00'
    t.time     "time_out",                   default: '2000-01-01 17:00:00'
    t.index ["deleted_at"], name: "index_regular_work_periods_on_deleted_at", using: :btree
  end

  create_table "rest_days", id: :string, limit: 36, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "employee_id",    limit: 36
    t.string   "remark",         limit: 256
    t.date     "implemented_on"
    t.string   "day"
    t.index ["deleted_at"], name: "index_rest_days_on_deleted_at", using: :btree
  end

  create_table "system_accounts", id: :string, limit: 36, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",          limit: 128
    t.string   "description",   limit: 512
    t.string   "account_type",  limit: 64
    t.string   "primary_image", limit: 512
    t.index ["deleted_at"], name: "index_system_accounts_on_deleted_at", using: :btree
  end

  create_table "system_constants", id: :string, limit: 36, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "label",          limit: 128
    t.string   "category_type",  limit: 256
    t.string   "value",          limit: 256
    t.date     "implemented_on"
    t.index ["deleted_at"], name: "index_system_constants_on_deleted_at", using: :btree
  end

  create_table "telephone_numbers", id: :string, limit: 36, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "digits",            limit: 64
    t.string   "contact_detail_id", limit: 36
    t.string   "remark",            limit: 256
    t.index ["deleted_at"], name: "index_telephone_numbers_on_deleted_at", using: :btree
  end

  create_table "vehicles", id: :string, limit: 36, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "color",                limit: 64
    t.string   "make",                 limit: 64
    t.string   "brand",                limit: 64
    t.string   "plate_number",         limit: 64
    t.string   "fuel_type",            limit: 64
    t.string   "description",          limit: 512
    t.date     "date_of_registration"
    t.string   "primary_image",        limit: 512
    t.index ["deleted_at"], name: "index_vehicles_on_deleted_at", using: :btree
  end

  create_table "vendors", id: :string, limit: 36, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "system_account_id", limit: 36
    t.index ["deleted_at"], name: "index_vendors_on_deleted_at", using: :btree
  end

end
