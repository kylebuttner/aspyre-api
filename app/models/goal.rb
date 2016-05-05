class Goal < ActiveRecord::Base
  has_many :tasks, dependent: :destroy
  validates_presence_of :name

  def self.get_goals
    Goal.all
  end

  def self.create_goal(goal_name)
    Goal.create(goal_name)
  end

  def self.update_goal(goal_id, goal_name)
    current_goal = Goal.find(goal_id)
    current_goal.update(goal_name)
  end

  def self.destroy_goal(goal_id)
    Goal.destroy(goal_id)
  end
end
