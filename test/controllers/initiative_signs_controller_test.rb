require 'test_helper'

class InitiativeSignsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get initiative_signs_create_url
    assert_response :success
  end

end
