require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_many(:goals).dependent(:destroy) }
  it { is_expected.to have_many(:tasks).dependent(:destroy) }
end
