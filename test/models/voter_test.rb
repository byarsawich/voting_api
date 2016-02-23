require 'test_helper'

class VoterTest < ActiveSupport::TestCase
  test "voter generates a token" do
    voter = Voter.create!(first_name: "Brian", last_name: "Yarsawich", party:"Independent")
    assert voter.token
  end

  test "voter validation" do
    v1 = Voter.create
    v2 = Voter.create(first_name: "Brian")
    v3 = Voter.create(first_name: "Brian", last_name: "Yarsawich")
    v4 = Voter.create(first_name: "Brian", last_name: "Yarsawich", party:"Independent")

    refute v1.id
    refute v2.id
    refute v3.id
    assert v4.id
  end

end
