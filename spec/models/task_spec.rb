require 'rails_helper'

RSpec.describe Task, type: :model do
  before :each do
    @user1 = FactoryGirl.create :user_with_goals
    @user2 = FactoryGirl.create :user_with_goals
    @goal1 = FactoryGirl.create :goal_with_tasks
  end
  it { is_expected.to belong_to(:goal) }
  it { is_expected.to belong_to(:user) }

  describe "validation" do
    it "must have a name" do
      task = Task.create(name: "")
      expect(task).not_to be_valid
    end
  end

  describe "CRUD methods" do
    describe "#get_tasks" do
      it 'should only retrieve current user tasks' do
        expect((Task.get_task(@goal1.id, 1)).length).to eq(3)
        # to match_array @goal1.tasks
      end
    end

    # describe '#create_goal' do
    #   it 'should create a goal with a user_id' do
    #     Goal.create_goal({"name": "goal 1"}, @user1.id)
    #     expect(Goal.all.last.name).to eq "goal 1"
    #   end
    # end
    #
    # describe '#update_goal' do
    #   it 'should update a goal' do
    #     Goal.update_goal(3, {"name": "updated"})
    #     expect(Goal.find(3).name).to eq "updated"
    #   end
    # end
    #
    # describe '#destroy_goal' do
    #   it 'should destroy a goal' do
    #     expect{Goal.destroy_goal(2)}.to change{Goal.all.count}.by(-1)
    #   end
    # end
  end
end
