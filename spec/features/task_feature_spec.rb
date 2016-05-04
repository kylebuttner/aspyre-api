require 'rails_helper'

describe 'tasks', type: :request do

  let(:parsed_response) { JSON.parse(response.body) }
  let(:request_headers) {{"Accept" => "application/json", "Content-Type" => "application/json"}}

  describe 'GET /tasks' do

    before :each do
      FactoryGirl.create(:goal)
      FactoryGirl.create_list(:task, 3)
    end

    it 'returns all tasks' do
      get('/goals/1/tasks', {}, request_headers)

      expect(response.status).to eq(200)

      expect(parsed_response[0]['name']).to eq('FactoryTaskName')
      expect(parsed_response.length).to eq(3)
    end
  end





end
