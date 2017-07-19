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

ActiveRecord::Schema.define(version: 20170719080926) do

  create_table "costs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "sn"
    t.integer  "payee_id"
    t.integer  "income_id"
    t.string   "abstract"
    t.date     "invoice_date"
    t.decimal  "tax_rate",       precision: 2
    t.decimal  "invoice_amount", precision: 10, scale: 2
    t.date     "cost_date"
    t.decimal  "cost_amount",    precision: 10, scale: 2
    t.string   "explain"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.index ["income_id"], name: "index_costs_on_income_id", using: :btree
    t.index ["payee_id"], name: "index_costs_on_payee_id", using: :btree
    t.index ["sn"], name: "index_costs_on_sn", using: :btree
  end

  create_table "incomes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "code"
    t.integer  "payer_id"
    t.string   "abstract"
    t.date     "bill_date"
    t.date     "account_date"
    t.decimal  "income_amount",     precision: 10, scale: 2
    t.decimal  "settlement_amount", precision: 10, scale: 2
    t.date     "invoice_date"
    t.integer  "invoice_num"
    t.decimal  "tax_rate",          precision: 2
    t.string   "explain"
    t.decimal  "discount_rate",     precision: 2
    t.decimal  "available_amount",  precision: 10, scale: 2
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.decimal  "actual_amount",     precision: 10, scale: 2
    t.date     "actual_date"
    t.index ["code"], name: "index_incomes_on_code", using: :btree
    t.index ["payer_id"], name: "index_incomes_on_payer_id", using: :btree
  end

  create_table "organizations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "superior_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "code"
  end

  create_table "payees", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "code"
    t.string   "name"
    t.string   "brief_name"
    t.integer  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_payees_on_code", using: :btree
  end

  create_table "payers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "code"
    t.string   "name"
    t.string   "brief_name"
    t.integer  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "username"
    t.string   "displayname"
    t.string   "password_digest"
    t.boolean  "enabled"
    t.integer  "organization_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "roles_mask"
  end

  add_foreign_key "costs", "incomes"
  add_foreign_key "costs", "payees"
  add_foreign_key "incomes", "payers"
end
