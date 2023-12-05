class CreateOrderstatuses < ActiveRecord::Migration[7.0]
  def change
    create_table :orderstatuses do |t|
      t.string :status

      t.timestamps
    end

    remove_column :orders, :status
    add_reference :orders, :orderstatus, foreign_key:true
  end
end
