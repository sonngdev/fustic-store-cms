class AddImageManagerIdToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :image_manager_id, :integer
  end
end
