FactoryGirl.define do
  factory :user do |u|
    u.sequence(:email) { |n| "testemail#{n}@test.com" }
    u.password "testpassword"
    u.sequence(:uid)

    factory :user_with_goals do
      after :create do |user|
        3.times do
          create :goal, user: user
        end
      end
    end
  end
end
