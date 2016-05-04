class Goal < ActiveRecord::Base
  has_many :tasks, dependent: :destroy

  def self.get_goals
    Goal.all
  end

  def self.create_goal(name: name)
    Goal.create(name: name)
  end

end
