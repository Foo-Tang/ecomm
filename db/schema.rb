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

ActiveRecord::Schema[7.0].define(version: 2023_11_11_231040) do
  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "province"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string "paytype"
    t.integer "payamount"
    t.integer "customer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
  end

  create_table "productorders", force: :cascade do |t|
    t.integer "quantity"
    t.integer "sellprice"
    t.integer "product_id", null: false
    t.integer "order_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_productorders_on_order_id"
    t.index ["product_id"], name: "index_productorders_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "price"
    t.integer "producttype_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "stocklevel"
    t.index ["producttype_id"], name: "index_products_on_producttype_id"
  end

  create_table "producttypes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wrestlerproducts", force: :cascade do |t|
    t.integer "wrestler_id", null: false
    t.integer "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_wrestlerproducts_on_product_id"
    t.index ["wrestler_id"], name: "index_wrestlerproducts_on_wrestler_id"
  end

  create_table "wrestlers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "orders", "customers"
  add_foreign_key "productorders", "orders"
  add_foreign_key "productorders", "products"
  add_foreign_key "products", "producttypes"
  add_foreign_key "wrestlerproducts", "products"
  add_foreign_key "wrestlerproducts", "wrestlers"
end
