class AddStocklevelToProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :stocklevel, :integer
  end
end
