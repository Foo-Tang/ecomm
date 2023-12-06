class AddAttributesToAbouts < ActiveRecord::Migration[7.0]
  def change
    add_column :abouts, :store_desc, :text
    add_column :abouts, :location, :text
    add_column :abouts, :hours, :text
    add_column :abouts, :phone, :text
    add_column :abouts, :email, :text
  end
end
