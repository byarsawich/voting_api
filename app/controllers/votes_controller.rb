class VotesController < ApplicationController
  def create
    voter_id = Voter.where(token: params["token"]).first.id
    Vote.create(candidate_id: params["candidate_id"].to_i, voter_id: voter_id)
  end

  def destroy
    p Vote.all
    Vote.destroy(params["vote_id"].to_i)
  end

  def index
  end
end
