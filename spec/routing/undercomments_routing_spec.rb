require "rails_helper"

RSpec.describe UndercommentsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/undercomments").to route_to("undercomments#index")
    end

    it "routes to #new" do
      expect(:get => "/undercomments/new").to route_to("undercomments#new")
    end

    it "routes to #show" do
      expect(:get => "/undercomments/1").to route_to("undercomments#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/undercomments/1/edit").to route_to("undercomments#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/undercomments").to route_to("undercomments#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/undercomments/1").to route_to("undercomments#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/undercomments/1").to route_to("undercomments#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/undercomments/1").to route_to("undercomments#destroy", :id => "1")
    end
  end
end
