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

ActiveRecord::Schema.define(version: 2019_07_22_005322) do

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.bigint "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_categories_on_group_id"
  end

  create_table "expences", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "input_user_id"
    t.string "type"
    t.string "pay_for_user"
    t.string "pay_for_group"
    t.boolean "pay_user_flag"
    t.bigint "pay_user_id"
    t.bigint "pay_group_id"
    t.string "day"
    t.float "money"
    t.bigint "category_id"
    t.string "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_expences_on_category_id"
    t.index ["input_user_id"], name: "index_expences_on_input_user_id"
    t.index ["pay_group_id"], name: "index_expences_on_pay_group_id"
    t.index ["pay_user_id"], name: "index_expences_on_pay_user_id"
    t.index ["type"], name: "index_expences_on_type"
  end

  create_table "expenses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "input_user_id"
    t.string "type"
    t.bigint "pay_for_user_id"
    t.bigint "pay_for_group_id"
    t.boolean "pay_user_flag"
    t.bigint "pay_user_id"
    t.bigint "pay_group_id"
    t.date "day"
    t.integer "money"
    t.bigint "category_id"
    t.string "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_expenses_on_category_id"
    t.index ["input_user_id"], name: "index_expenses_on_input_user_id"
    t.index ["pay_for_group_id"], name: "index_expenses_on_pay_for_group_id"
    t.index ["pay_for_user_id"], name: "index_expenses_on_pay_for_user_id"
    t.index ["pay_group_id"], name: "index_expenses_on_pay_group_id"
    t.index ["pay_user_id"], name: "index_expenses_on_pay_user_id"
    t.index ["type"], name: "index_expenses_on_type"
  end

  create_table "groups", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "months", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "group_id"
    t.date "open_day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_months_on_group_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users_groups_relationships", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "group_id"
    t.string "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_users_groups_relationships_on_group_id"
    t.index ["user_id", "group_id"], name: "index_users_groups_relationships_on_user_id_and_group_id", unique: true
    t.index ["user_id"], name: "index_users_groups_relationships_on_user_id"
  end

  add_foreign_key "categories", "groups"
  add_foreign_key "expences", "categories"
  add_foreign_key "expences", "groups", column: "pay_group_id"
  add_foreign_key "expences", "users", column: "input_user_id"
  add_foreign_key "expences", "users", column: "pay_user_id"
  add_foreign_key "expenses", "categories"
  add_foreign_key "expenses", "groups", column: "pay_for_group_id"
  add_foreign_key "expenses", "groups", column: "pay_group_id"
  add_foreign_key "expenses", "users", column: "input_user_id"
  add_foreign_key "expenses", "users", column: "pay_for_user_id"
  add_foreign_key "expenses", "users", column: "pay_user_id"
  add_foreign_key "months", "groups"
  add_foreign_key "users_groups_relationships", "groups"
  add_foreign_key "users_groups_relationships", "users"
end
