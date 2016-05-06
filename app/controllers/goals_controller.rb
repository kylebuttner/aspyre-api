class GoalsController < ApplicationController
  
  def index
    @goals = Goal.get_goals
    render json: @goals
  end

  def create
    Goal.create_goal(goal_params)
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
      params.require(:goal).permit(:name)
    end
end
