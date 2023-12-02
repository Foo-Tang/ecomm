class Updateprovincereference < ActiveRecord::Migration[7.0]
  def change
    remove_reference :customers, :provinces, foreign_key:true

    add_reference :customers, :province, foreign_key: true
  end
end
