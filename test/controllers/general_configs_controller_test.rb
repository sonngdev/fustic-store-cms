require 'test_helper'

class GeneralConfigsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @general_config = general_configs(:one)
  end

  test "should get index" do
    get general_configs_url
    assert_response :success
  end

  test "should get new" do
    get new_general_config_url
    assert_response :success
  end

  test "should create general_config" do
    assert_difference('GeneralConfig.count') do
      post general_configs_url, params: { general_config: { active: @general_config.active, landing_vimeo_id: @general_config.landing_vimeo_id } }
    end

    assert_redirected_to general_config_url(GeneralConfig.last)
  end

  test "should show general_config" do
    get general_config_url(@general_config)
    assert_response :success
  end

  test "should get edit" do
    get edit_general_config_url(@general_config)
    assert_response :success
  end

  test "should update general_config" do
    patch general_config_url(@general_config), params: { general_config: { active: @general_config.active, landing_vimeo_id: @general_config.landing_vimeo_id } }
    assert_redirected_to general_config_url(@general_config)
  end

  test "should destroy general_config" do
    assert_difference('GeneralConfig.count', -1) do
      delete general_config_url(@general_config)
    end

    assert_redirected_to general_configs_url
  end
end
