require 'rails_helper'

describe 'Goals', type: :request do
  let(:parsed_response) { JSON.parse(response.body) }

  before :each do
    @user = FactoryGirl.create :user_with_goals
    @request_headers = {"Accept" => "application/json", "Content-Type" => "application/json"}
    @auth_headers = @user.create_new_auth_token
    @request_headers.merge!(@auth_headers)
  end

  describe 'GET /goals' do
    before :each do
      FactoryGirl.create_list(:goal, 3)
    end

    it 'returns all goals' do
      get('/goals', {}, @request_headers)

      expect(response.status).to eq 200

      expect(parsed_response[0]['name']).to eq("FactoryGoalName")
      expect(parsed_response.length).to eq(3)
    end
  end

  describe 'POST /goals' do
    it 'saves a goal to the model' do
      goal_params = {name: "Learn piano"}.to_json

      post("/goals", goal_params, @request_headers)

      expect(response.status).to eq 201
      expect(Goal.last.name).to eq("Learn piano")
    end
  end

  describe 'PUT /goals' do
    it 'updates the entry of a goal' do
      goal_params = {name: "Learn violin"}.to_json

      put("/goals/1", goal_params, @request_headers)

      expect(response.status).to eq 202
      expect(Goal.first.name).to eq("Learn violin")
    end
  end

  describe 'DELETE /goals' do

    it 'deletes a goal entry' do
      delete("/goals/1", @request_headers)

      expect(response.status).to eq 204
      expect(Goal.count).to eq(2)
    end
  end
end
