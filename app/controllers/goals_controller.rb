class GoalsController < ApplicationController

  def index
    @goals = Goal.all
    render json: @goals
  end

  def create
    Goal.create(name: params[:name])
    render json:{}, status: :created  
  end

private

  def goals_params
    params.require(:goal).permit(:name)
  end
end
