require 'rails_helper'

RSpec.describe Goal, type: :model do
  before :each do
    @user1 = FactoryGirl.create :user_with_goals
    @user2 = FactoryGirl.create :user_with_goals
  end
  
  it { is_expected.to have_many(:tasks).dependent(:destroy) }

  describe "CRUD methods" do
    describe "#get_goals" do
      it 'should only retrieve current user goals' do
        expect(Goal.get_goals(@user1.id)).to match_array @user1.goals
      end
    end

    describe '#create_goal' do
      it 'should create a goal with a user_id' do
        Goal.create_goal({"name": "goal 1"}, @user1.id)
        expect(Goal.all.last.name).to eq "goal 1"
      end
    end

    describe '#update_goal' do
      it 'should update a goal' do
        Goal.update_goal(3, {"name": "updated"})
        expect(Goal.find(3).name).to eq "updated"
      end
    end

    describe '#destroy_goal' do
      it 'should destroy a goal' do
        expect{Goal.destroy_goal(2)}.to change{Goal.all.count}.by(-1)
      end
    end
  end

  context "validation" do
    it "must have a name" do
      goal = Goal.create(name: "")
      expect(goal).not_to be_valid
    end
  end
end
