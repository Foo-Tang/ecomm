class CreateWrestlerproducts < ActiveRecord::Migration[7.0]
  def change
    create_table :wrestlerproducts do |t|
      t.references :wrestler, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
