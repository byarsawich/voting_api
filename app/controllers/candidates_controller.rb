class CandidatesController < ApplicationController
  def index
    render json: Candidate.all
  end

  def show
    render json: Candidate.order(:id).first
  end

  def create
    c = Candidate.create(first_name: params["first_name"], last_name: params["last_name"], party: params["party"])
    render json: c
  end
end
