class UpdateCustomer < ActiveRecord::Migration[7.0]
  def change
    remove_column :customers, :province

    add_reference :customers, :provinces, foreign_key: true
  end
end
