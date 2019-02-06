require 'rails_helper'

RSpec.describe "Undercomments", type: :request do
  describe "GET /undercomments" do
    it "works! (now write some real specs)" do
      get undercomments_path
      expect(response).to have_http_status(200)
    end
  end
end
