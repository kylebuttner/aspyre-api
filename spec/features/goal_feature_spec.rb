require 'rails_helper'

describe 'Goals', type: :request do
  let(:parsed_response) { JSON.parse(response.body) }

  describe 'GET /goals' do
    before :each do
      FactoryGirl.create_list(:goal, 3)
    end

    it 'returns all goals' do
      get '/goals', {}, { 'Accept': 'application/json' }

      expect(response.status).to eq 200

      expect(parsed_response[0]['name']).to eq("FactoryGoalName")
      expect(parsed_response.length).to eq(3)
    end
  end
end
