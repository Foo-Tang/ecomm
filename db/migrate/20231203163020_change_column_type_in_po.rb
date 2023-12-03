class ChangeColumnTypeInPo < ActiveRecord::Migration[7.0]
  def change
    change_column :productorders, :sellprice, :decimal
  end
end
