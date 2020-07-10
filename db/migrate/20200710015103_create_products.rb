class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :slug
      t.integer :price_vnd
      t.decimal :price_usd, precision: 6, scale: 2

      t.timestamps
    end
  end
end
