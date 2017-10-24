require 'test_helper'

class Backoffice::SettingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backoffice_settings_index_url
    assert_response :success
  end

end
