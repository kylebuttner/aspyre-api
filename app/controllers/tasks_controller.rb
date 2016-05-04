class TasksController < ApplicationController

  def index
    @tasks = Task.get_tasks(params[:goal_id])
    render json: @tasks
  end

  def create
    Task.create_task(name: params[:name])
    render json:{}, status: :created
  end

  def update
    current_task = Task.find(params[:id])
    current_task.update(task_params)
    render json:{}, status: :accepted
  end

  private

    def task_params
      params.require(:task).permit(:name)
    end

end
