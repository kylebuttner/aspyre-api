class TasksController < ApplicationController

  before_action :authenticate_user!

  def index
    @tasks = Task.get_tasks(params[:goal_id], current_user)
    render json: @tasks
  end

  def create
    Task.create_task(task_params, params[:goal_id])
    render json:{}, status: :created
  end

  def update
    Task.update_task((params[:id]), task_params)
    render json:{}, status: :accepted
  end

  def destroy
    Task.destroy_task(params[:id])
    render nothing: true, status: :no_content
  end

  private
    def task_params
      params.require(:task).permit(:name, :completed, :frequency, :goal_id)
    end
end
