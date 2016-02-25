class VotesController < ApplicationController
  def create
    if params["voter_id"] == true
      voter_id = Voter.where(token: params["token"]).first.id
      v = Vote.create(candidate_id: params["candidate_id"].to_i, voter_id: voter_id)
      render json: v
    else
      render json: "Invalid token"
    end
  end

  def destroy
    if params["voter_id"] == true
      Vote.destroy(params["vote_id"].to_i)
    else
      render json: "Invalid token"
    end
  end

  def index
  end

end
