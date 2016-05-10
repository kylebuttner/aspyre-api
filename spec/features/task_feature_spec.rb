require 'rails_helper'

describe 'tasks', type: :request do

  let(:parsed_response) { JSON.parse(response.body) }

  before :each do
    
    @user = FactoryGirl.create :user_with_goals
    @request_headers = {"Accept" => "application/json", "Content-Type" => "application/json"}
    @auth_headers = @user.create_new_auth_token
    @request_headers.merge!(@auth_headers)
  end

  describe 'GET /tasks' do

    before :each do
      FactoryGirl.create_list(:task, 3)
    end

    it 'returns all tasks for a given goal' do
      get('/goals/1/tasks', {}, @request_headers)
      
      expect(response.status).to eq(200)
      expect(parsed_response[0]['name']).to eq('FactoryTaskName')
      expect(parsed_response.length).to eq(3)
    end
  end

  describe 'POST /tasks' do
    it 'creates a task' do
      task_params = FactoryGirl.create(:task).to_json
      post('/goals/1/tasks', task_params, @request_headers)

      expect(response.status).to eq(201)
      expect(Task.first.name).to eq("FactoryTaskName")
    end
  end

  describe 'PUT /tasks' do
    it 'updates the entry of a task' do
      task = FactoryGirl.create(:task)
      task_params = {name: "Step 1"}.to_json
      put("/tasks/1", task_params, @request_headers)

      expect(response.status).to eq 202
      expect(Task.first.name).to eq("Step 1")
      end
  end

  describe 'DELETE /tasks' do
    before :each do
      FactoryGirl.create_list(:task, 3)
    end

    it 'deletes a task entry' do
      delete("/tasks/1", @request_headers)

      expect(response.status).to eq 204
      expect(Task.count).to eq(2)
    end
  end





end
