return json.nil! if general_config.blank?

json.extract! general_config, :id, :landing_vimeo_id, :landing_placeholder_image_url, :active, :created_at, :updated_at
