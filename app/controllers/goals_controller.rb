class GoalsController < ApplicationController

  def index
    @goals = Goal.get_goals
    render json: @goals
  end

  def create
    Goal.create_goal(name: params[:name])
    render json:{}, status: :created
  end

  def update
    current_goal = Goal.find(params[:id])
    current_goal.update(name: (params[:name])) 
    render json:{}, status: :accepted
  end

end
