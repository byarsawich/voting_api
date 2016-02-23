require 'test_helper'

class CandidateTest < ActiveSupport::TestCase
  test "candidate has votes" do
    c = Candidate.create!(first_name: "Ross", last_name:"Perot", district:"1st District", party:"Independent")
    c.votes << Vote.create!
    c.votes << Vote.create!

    assert_equal 2, c.votes.count
  end

  test "candidate validation" do
    c1 = Candidate.create
    c2 = Candidate.create(first_name: "Ross")
    c3 = Candidate.create(first_name: "Ross", last_name: "Perot")
    c4 = Candidate.create(first_name: "Ross", last_name: "Perot", party:"Independent")

    refute c1.id
    refute c2.id
    refute c3.id
    assert c4.id
  end
end
