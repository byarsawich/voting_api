require 'test_helper'

class VotesControllerTest < ActionController::TestCase
  test "should get create" do
    get :create
    assert_response :success
  end

  test "create a vote" do
    post :create, {candidate_id: "1", token: "UZLdOkzop70Ddx-IJR0ABg"}
    voter_id =  Voter.where(token: "UZLdOkzop70Ddx-IJR0ABg").first.id
    refute Vote.where(voter_id: voter_id).empty?
  end

  test "should get destroy" do
    get :destroy
    assert_response :success
  end

  test "destroy a vote" do
    get :destroy, {vote_id: "1"}
    refute Vote.find(1)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
