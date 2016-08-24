require 'test_helper'

class InitiativesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @initiative = initiatives(:one)
  end

  test "should get index" do
    get initiatives_url
    assert_response :success
  end

  test "should get new" do
    get new_initiative_url
    assert_response :success
  end

  test "should create initiative" do
    assert_difference('Initiative.count') do
      post initiatives_url, params: { initiative: { active: @initiative.active, description: @initiative.description, hashtag: @initiative.hashtag, image: @initiative.image, ong_id: @initiative.ong_id, title: @initiative.title } }
    end

    assert_redirected_to initiative_url(Initiative.last)
  end

  test "should show initiative" do
    get initiative_url(@initiative)
    assert_response :success
  end

  test "should get edit" do
    get edit_initiative_url(@initiative)
    assert_response :success
  end

  test "should update initiative" do
    patch initiative_url(@initiative), params: { initiative: { active: @initiative.active, description: @initiative.description, hashtag: @initiative.hashtag, image: @initiative.image, ong_id: @initiative.ong_id, title: @initiative.title } }
    assert_redirected_to initiative_url(@initiative)
  end

  test "should destroy initiative" do
    assert_difference('Initiative.count', -1) do
      delete initiative_url(@initiative)
    end

    assert_redirected_to initiatives_url
  end
end
