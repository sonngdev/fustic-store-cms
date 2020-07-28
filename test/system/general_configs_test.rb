require "application_system_test_case"

class GeneralConfigsTest < ApplicationSystemTestCase
  setup do
    @general_config = general_configs(:one)
  end

  test "visiting the index" do
    visit general_configs_url
    assert_selector "h1", text: "General Configs"
  end

  test "creating a General config" do
    visit general_configs_url
    click_on "New General Config"

    check "Active" if @general_config.active
    fill_in "Landing vimeo", with: @general_config.landing_vimeo_id
    click_on "Create General config"

    assert_text "General config was successfully created"
    click_on "Back"
  end

  test "updating a General config" do
    visit general_configs_url
    click_on "Edit", match: :first

    check "Active" if @general_config.active
    fill_in "Landing vimeo", with: @general_config.landing_vimeo_id
    click_on "Update General config"

    assert_text "General config was successfully updated"
    click_on "Back"
  end

  test "destroying a General config" do
    visit general_configs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "General config was successfully destroyed"
  end
end
