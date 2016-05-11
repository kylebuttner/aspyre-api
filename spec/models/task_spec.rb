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
        expect((Task.get_tasks(@goal1.id, 1)).length).to eq(3)
        # to match_array @goal1.tasks
      end
    end

    describe '#create_task' do
      it 'should create a task with a goal_id' do
        Task.create_task({"name": "Task1", "completed": false, "frequency": "daily"}, @goal1.id)
        expect(Task.all.last.name).to eq "Task1"
      end
    end

    describe '#update_task' do
      it 'should update a task' do
        Task.update_task(1, {"name": "updated"})
        expect(Task.find(1).name).to eq "updated"
      end
    end

    describe '#destroy_task' do
      it 'should destroy a task' do
        expect{Task.destroy_task(2)}.to change{Task.all.count}.by(-1)
      end
    end
  end
end
