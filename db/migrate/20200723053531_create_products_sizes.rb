class CreateProductsSizes < ActiveRecord::Migration[6.0]
  def change
    create_table :products_sizes do |t|
      t.integer :product_id
      t.integer :size_id
      t.integer :quantity

      t.timestamps
    end
  end
end
