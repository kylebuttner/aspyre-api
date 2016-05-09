class GoalsController < ApplicationController

  # before_action :authenticate_user!

  def index
    @goals = Goal.get_goals(current_user.id)
    render json: @goals
  end

  def create
    Goal.create_goal(goal_params, current_user.id)
    render json:{}, status: :created
  end

  def update
    Goal.update_goal((params[:id]), goal_params)
    render json:{}, status: :accepted
  end

  def destroy
    Goal.destroy_goal(params[:id])
    render nothing: true, status: :no_content
  end

  private

    def goal_params
      params.require(:goal).permit(:name, :complete)
    end
end
