class TasksController < ApplicationController

  def index
    @current_goal = Goal.find(params[:goal_id])
    @tasks = Task.where(goal_id: @current_goal.id)
    render json: @tasks
  end


end
