require 'rails_helper'

RSpec.describe "Agreements", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/agreements/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/agreements/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/agreements/create"
      expect(response).to have_http_status(:success)
    end
  end

end
