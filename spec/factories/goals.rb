FactoryGirl.define do
  # factory :goal do
  #   name "FactoryGoalName"
  # end
  factory :goal do |u|
    u.sequence(:name) { |n| "FactoryGoalName#{n}"}
    # g.sequence(:id)

    factory :goal_with_tasks do
      after :create do |goal|
        3.times do
          create :task, goal: goal
        end
      end
    end
  end
end
