class AddLandingPlaceholderImageUrlToGeneralConfigs < ActiveRecord::Migration[6.0]
  def change
    add_column :general_configs, :landing_placeholder_image_url, :string
  end
end
