class Task < ActiveRecord::Base
  belongs_to :goal

  def self.get_tasks(goal_id)
    current_goal = Goal.find(goal_id)
    Task.where(goal_id: current_goal.id)
  end

  def self.create_task(task_name)
    Task.create(task_name)
  end

end
