# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2024_09_08_072745) do

  create_table "coffee_shops", force: :cascade do |t|
    t.string "name", null: false
    t.string "address", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "order_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.integer "coffee_shop_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "order_id"
    t.index ["coffee_shop_id"], name: "index_customers_on_coffee_shop_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name", null: false
    t.float "amount", null: false
    t.boolean "available", default: false
    t.string "category"
    t.integer "coffee_shop_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "order_id"
    t.index ["coffee_shop_id"], name: "index_items_on_coffee_shop_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "quantity", null: false
    t.integer "item_id", null: false
    t.integer "order_id"
    t.float "amount"
    t.string "item_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_order_items_on_item_id"
    t.index ["order_id"], name: "index_order_items_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.float "total_amount"
    t.integer "discount_rate"
    t.boolean "free", default: false
    t.boolean "ready", default: false
    t.integer "status"
    t.integer "customer_id"
    t.integer "coffee_shop_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["coffee_shop_id"], name: "index_orders_on_coffee_shop_id"
    t.index ["customer_id"], name: "index_orders_on_customer_id"
  end

  add_foreign_key "customers", "coffee_shops"
  add_foreign_key "items", "coffee_shops"
  add_foreign_key "order_items", "orders"
  add_foreign_key "orders", "coffee_shops"
  add_foreign_key "orders", "customers"
end
