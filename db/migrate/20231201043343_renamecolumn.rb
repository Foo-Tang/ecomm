class Renamecolumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :customers, :phone, :postal_code
  end
end
