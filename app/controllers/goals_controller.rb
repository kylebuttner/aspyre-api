class GoalsController < ApplicationController

  def index
    @goals = Goal.get_goals
    render json: @goals
  end

  def create
    Goal.create_goal(name: params[:name])
    render json:{}, status: :created
  end

end
