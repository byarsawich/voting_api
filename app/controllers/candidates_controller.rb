class CandidatesController < ApplicationController
  def index
    render json: Candidate.all
  end

  def show
  end

  def create
  end
end
