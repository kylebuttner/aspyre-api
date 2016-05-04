class Task < ActiveRecord::Base

  def self.get_tasks(goal_id)
    current_goal = Goal.find(goal_id)
    Task.where(goal_id: current_goal.id)
  end
  
end
