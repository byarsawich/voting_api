require 'test_helper'

class VotersControllerTest < ActionController::TestCase
  test "should get create" do
    get :create
    assert_response :success
  end

  test "create user" do
    post :create, {first_name: "James", last_name: "May", party: "Independent"}
    refute Voter.where(last_name:"May").empty?
  end

  test "should get show" do
    get :show, id: voters(:one)
    assert_response :success
  end

  test "show voter with token authentication" do
    get :show, {token: "UZLdOkzop70Ddx-IJR0ABg"}
    token = "UZLdOkzop70Ddx-IJR0ABg"
    assert_equal Voter.where(token: token).to_json, response.body
  end

  test "should fail to update without token" do
    v = Voter.create!(first_name: "Mason", last_name: "Matthews", party: "AllTheTime")
    patch :update, id: v.id, voters: {first_name: "TheDude"}
    v.reload
    assert_equal "Mason", v.first_name
  end

  test "should update with token" do
    v = Voter.create!(first_name: "Mason", last_name: "Matthews", party: "AllTheTime")
    patch :update, id: v.id, token: v.token, voters: {first_name: "TheDude"}
    v.reload
    assert_equal "TheDude", v.first_name
  end

  test "should only update passed params" do
    v = Voter.create!(first_name: "Mason", last_name: "Matthews", party: "AllTheTime")
    patch :update, id: v.id, token: v.token, voters: {first_name: "TheDude"}
    v.reload
    assert_equal "AllTheTime", v.party
  end

  test "should get update" do
    get :update, id: voters(:one)
    assert_response :success
  end

end
