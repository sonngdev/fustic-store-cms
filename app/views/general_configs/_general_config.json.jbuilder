json.general_config do
  return json.nil! if general_config.blank?

  json.extract! general_config, :id, :landing_vimeo_id, :active, :created_at, :updated_at
end
