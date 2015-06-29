require "rails_helper"

RSpec.describe UuidsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/uuids").to route_to("uuids#index")
    end

    it "routes to #new" do
      expect(:get => "/uuids/new").to route_to("uuids#new")
    end

    it "routes to #show" do
      expect(:get => "/uuids/1").to route_to("uuids#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/uuids/1/edit").to route_to("uuids#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/uuids").to route_to("uuids#create")
    end

    it "routes to #update" do
      expect(:put => "/uuids/1").to route_to("uuids#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/uuids/1").to route_to("uuids#destroy", :id => "1")
    end

  end
end
