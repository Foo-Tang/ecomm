class CreateProductorders < ActiveRecord::Migration[7.0]
  def change
    create_table :productorders do |t|
      t.integer :quantity
      t.integer :sellprice
      t.references :product, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
