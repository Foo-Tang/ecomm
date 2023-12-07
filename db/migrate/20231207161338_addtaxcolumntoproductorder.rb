class Addtaxcolumntoproductorder < ActiveRecord::Migration[7.0]
  def change
    add_column :productorders, :taxrate, :decimal
  end
end
