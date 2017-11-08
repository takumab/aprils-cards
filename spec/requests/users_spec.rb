require 'rails_helper'

RSpec.describe "Users API", type: :request do

  let!(:users) { create_list(:user, 5) }
  let(:user_id) { users.first.id }

  describe "POST /users" do
    let(:user_params) {{ email: 'tomjones@example.com', password: '12345678' }}

    before { post '/api/v1/users', params: user_params }

    it "creates a user" do
      expect(response).to have_http_status(201)
    end

    it "invalid attributes from user" do
      expect(response).to have_http_status(422)
    end
  end

  describe "DELETE /users/:id" do
    before { delete "/api/v1/users/#{user_id}"}

    it "returns status 204" do
      expect(response).to have_http_status(204)
    end
  end

end
