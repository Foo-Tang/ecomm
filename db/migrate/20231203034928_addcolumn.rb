class Addcolumn < ActiveRecord::Migration[7.0]
  def change
    add_column :provinces, :tax_code, :int
  end
end
