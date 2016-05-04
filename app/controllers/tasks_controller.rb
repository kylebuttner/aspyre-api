class TasksController < ApplicationController

  def index
    @tasks = Task.get_tasks(params[:goal_id])
    render json: @tasks
  end

  def create
    Task.create_task(name: params[:name])
    render json:{}, status: :created
  end

end
