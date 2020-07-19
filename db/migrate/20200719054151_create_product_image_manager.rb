class CreateProductImageManager < ActiveRecord::Migration[6.0]
  def change
    create_table :product_image_managers do |t|
      t.integer :product_id
      t.string :order
      t.integer :thumbnail_id
      t.integer :alt_thumbnail_id

      t.timestamps
    end
  end
end
