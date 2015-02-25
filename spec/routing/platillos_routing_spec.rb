require "rails_helper"

RSpec.describe PlatillosController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/platillos").to route_to("platillos#index")
    end

    it "routes to #new" do
      expect(:get => "/platillos/new").to route_to("platillos#new")
    end

    it "routes to #show" do
      expect(:get => "/platillos/1").to route_to("platillos#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/platillos/1/edit").to route_to("platillos#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/platillos").to route_to("platillos#create")
    end

    it "routes to #update" do
      expect(:put => "/platillos/1").to route_to("platillos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/platillos/1").to route_to("platillos#destroy", :id => "1")
    end

  end
end
