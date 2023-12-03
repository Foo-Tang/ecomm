class Addcolumnstoorder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :status, :string
    add_column :orders, :paymentid, :string
  end
end
