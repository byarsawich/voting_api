class VotersController < ApplicationController
  def create
    Voter.create(first_name: params["first_name"], last_name: params["last_name"], party: params["party"])
  end

  def show
    render json: Voter.where(token: params["token"])
  end

  def update
    
  end
end
