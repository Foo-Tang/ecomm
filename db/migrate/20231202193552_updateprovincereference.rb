class Updateprovincereference < ActiveRecord::Migration[7.0]
  def change
    add_reference :customers, :province, foreign_key: true
  end
end
