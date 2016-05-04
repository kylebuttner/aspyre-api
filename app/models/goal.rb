class Goal < ActiveRecord::Base
  has_many :tasks, dependent: :destroy

  def self.get_goals
    Goal.all
  end

  def self.create_goal(goal_name)
    Goal.create(goal_name)
  end

end
