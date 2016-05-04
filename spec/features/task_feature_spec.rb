require 'rails_helper'

describe 'tasks', type: :request do

  let(:parsed_response) { JSON.parse(response.body) }
  let(:request_headers) {{"Accept" => "application/json", "Content-Type" => "application/json"}}

  before :each do
    FactoryGirl.create(:goal)
  end

  describe 'GET /tasks' do

    before :each do
      FactoryGirl.create_list(:task, 3)
    end

    it 'returns all tasks' do
      get('/goals/1/tasks', {}, request_headers)

      expect(response.status).to eq(200)

      expect(parsed_response[0]['name']).to eq('FactoryTaskName')
      expect(parsed_response.length).to eq(3)
    end
  end

  describe 'POST /tasks' do

    it 'creates a task' do
      task_params = {name: "Task thing" }.to_json

      post('/goals/1/tasks', task_params, request_headers)

      expect(response.status).to eq(201)
      expect(Task.first.name).to eq("Task thing")
    end

  end





end
