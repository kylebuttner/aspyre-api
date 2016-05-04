class Goal < ActiveRecord::Base
  has_many :tasks, dependent: :destroy
  validates_presence_of :name

  def self.get_goals
    Goal.all
  end

  def self.create_goal(goal_name)
    Goal.create(goal_name)
  end

end
