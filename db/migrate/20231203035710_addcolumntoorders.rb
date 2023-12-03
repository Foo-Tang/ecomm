class Addcolumntoorders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :taxcode, :int
  end
end
