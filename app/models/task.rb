class Task < ActiveRecord::Base
  belongs_to :goal
  belongs_to :user
  validates_presence_of :name

  def self.get_tasks(goal_id, user_id)
    return self.get_goal_task(goal_id) if goal_id
    self.all_tasks(user_id)
  end

  def self.create_task(task_params, goal_id)
    goal = Goal.find(goal_id)
    task = goal.tasks.create(task_params)
    self.add_user_id(task)
  end

  def self.update_task(task_id, task_params)
    current_task = Task.find(task_id)
    current_task.update(task_params)
  end

  def self.destroy_task(task_id)
    Task.destroy(task_id)
  end

  private

  def self.all_tasks(user_id)
    Task.where(user_id: user_id)
  end

  def self.get_goal_task(goal_id)
    current_goal = Goal.find(goal_id)
    Task.where(goal_id: current_goal.id)
  end

  def self.add_user_id(task)
    user = self.get_user_id(task.goal_id)
    task.user_id = user.id
    task.save
  end

  def self.get_user_id(goal_id)
    goal = Goal.find(goal_id)
    user = User.find(goal.user_id)
  end
end
