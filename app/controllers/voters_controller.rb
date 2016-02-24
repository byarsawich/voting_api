class VotersController < ApplicationController
  def create
  end

  def show
    render json: Voter.where(token: params["token"])
  end

  def update
  end
end
