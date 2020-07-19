class CreateGeneralConfigs < ActiveRecord::Migration[6.0]
  def change
    create_table :general_configs do |t|
      t.string :landing_vimeo_id
      t.boolean :active

      t.timestamps
    end
  end
end
