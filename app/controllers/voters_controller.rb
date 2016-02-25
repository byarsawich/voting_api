class VotersController < ApplicationController
  def create
    v = Voter.create(first_name: params["first_name"], last_name: params["last_name"], party: params["party"])
    render json: v
  end

  def show
    render json: Voter.where(token: params["token"])
  end

  def update
    v = Voter.find(params[:id])
    if params[:token] == v.token
      v.update(voter_params)
      render json: v
    else
      render json: "Invalid Token"
    end
  end

  private def voter_params
    params.require(:voters).permit(:first_name, :last_name, :party)
  end
end
