class CreateTaxcodes < ActiveRecord::Migration[7.0]
  def change
    create_table :taxcodes do |t|
      t.string :province
      t.decimal :pst
      t.decimal :hst
      t.decimal :gst
      t.decimal :applicable

      t.timestamps
    end
  end
end
