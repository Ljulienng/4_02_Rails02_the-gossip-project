require 'rails_helper'

RSpec.describe DynamicController, type: :controller do

  describe "GET #welcome" do
    it "returns http success" do
      get :welcome
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #gossip_list" do
    it "returns http success" do
      get :gossip_list
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #gossip_page" do
    it "returns http success" do
      get :gossip_page
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #user_page" do
    it "returns http success" do
      get :user_page
      expect(response).to have_http_status(:success)
    end
  end

end
