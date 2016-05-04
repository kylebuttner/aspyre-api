require 'rails_helper'

RSpec.describe Goal, type: :model do
  it { is_expected.to have_many(:tasks).dependent(:destroy) }


  it "must have a name" do
    goal = Goal.new(name: "")
    expect(goal).not_to be_valid
  end
end
