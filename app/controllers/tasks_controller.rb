class TasksController < ApplicationController

  def index
    @tasks = Task.get_tasks(params[:goal_id])
    render json: @tasks
  end


end
