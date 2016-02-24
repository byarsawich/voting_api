require 'test_helper'

class VotersControllerTest < ActionController::TestCase
  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "show voter with token authentication" do
    get :show, {token: "UZLdOkzop70Ddx-IJR0ABg"}
    token = "UZLdOkzop70Ddx-IJR0ABg"
    assert_equal Voter.where(token: token).to_json, response.body
  end

  test "should get update" do
    get :update
    assert_response :success
  end

end
