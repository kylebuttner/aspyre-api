class Task < ActiveRecord::Base
  belongs_to :goal

  def self.get_tasks(goal_id)
    current_goal = Goal.find(goal_id)
    Task.where(goal_id: current_goal.id)
  end

  def self.create_task(task_name)
    Task.create(task_name)
  end

  def self.update_task(task_id, task_name)
    current_task = Task.find(task_id)
    current_task.update(task_name)
  end

  def self.destroy_task(task_id)
    Task.destroy(task_id)
  end


end
