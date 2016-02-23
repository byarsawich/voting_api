require 'test_helper'

class CandidatesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "index returns all candidates" do
    get :index
    assert_equal Candidate.all.to_json, response.body
  end

  test "show returns first candidate" do
    get :show
    assert_equal Candidate.order(:id).first.to_json, response.body
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

end
