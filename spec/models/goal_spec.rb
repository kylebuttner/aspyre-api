require 'rails_helper'

RSpec.describe Goal, type: :model do
  it { is_expected.to have_many :tasks }
end
