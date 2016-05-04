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
    current_goal = Goal.find(params[:id])
    current_goal.update(goal_params)
    render json:{}, status: :accepted
  end

  def destroy
    current_goal = Goal.find(params[:id])
    current_goal.destroy
    render nothing: true, status: :no_content
  end



  private

    def goal_params
      params.require(:goal).permit(:name)
    end

end
