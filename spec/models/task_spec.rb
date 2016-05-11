require 'rails_helper'

RSpec.describe Task, type: :model do
  it { is_expected.to belong_to(:goal) }
  it { is_expected.to belong_to(:user) }

  describe "validation" do
    it "must have a name" do
      task = Task.create(name: "")
      expect(task).not_to be_valid
    end
  end
end
