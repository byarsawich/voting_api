require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  test "only one vote per voter" do
    voter = Voter.create(first_name: "Brian", last_name: "Yarsawich", party:"Independent")
    v1 = Vote.create
    v2 = Vote.create
    voter.vote = v1
    v1.save
    assert_equal v1.voter_id, voter.id
    voter.vote = v2
    v2.save
    assert_equal v2.voter_id, voter.id
    refute_equal v1.voter_id, voter.id
  end
end
