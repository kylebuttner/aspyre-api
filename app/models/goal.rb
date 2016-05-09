class Goal < ActiveRecord::Base
  has_many :tasks, dependent: :destroy
  belongs_to :user
  validates_presence_of :name

  def self.get_goals(user_id)
    Goal.where(user_id: user_id)
  end

  def self.create_goal(goal_name, user_id)
    user = User.find(user_id)
    user.goals.create(goal_name)
  end

  def self.update_goal(goal_id, goal_params)
    puts 'valuesssssssss'
    p goal_params
    puts
    current_goal = Goal.find(goal_id)
    current_goal.update(goal_params)
  end

  def self.destroy_goal(goal_id)
    Goal.destroy(goal_id)
  end
end
