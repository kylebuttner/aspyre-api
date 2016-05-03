class GoalsController < ApplicationController

  def index
    @goals = Goal.all
    render json: @goals
  end
end
