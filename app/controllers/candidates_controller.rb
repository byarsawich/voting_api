class CandidatesController < ApplicationController
  def index
    render json: Candidate.all
  end

  def show
    render json: Candidate.order(:id).first
  end

  def create
    Candidate.create(first_name: params["first_name"], last_name: params["last_name"], party: params["party"])
  end
end
