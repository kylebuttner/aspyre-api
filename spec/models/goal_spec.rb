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
  end

  context "validation" do
    it "must have a name" do
      goal = Goal.create(name: "")
      expect(goal).not_to be_valid
    end
  end
end
