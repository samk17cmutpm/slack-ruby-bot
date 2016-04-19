require "rails_helper"

RSpec.describe SlackBotsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/slack_bots").to route_to("slack_bots#index")
    end

    it "routes to #new" do
      expect(:get => "/slack_bots/new").to route_to("slack_bots#new")
    end

    it "routes to #show" do
      expect(:get => "/slack_bots/1").to route_to("slack_bots#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/slack_bots/1/edit").to route_to("slack_bots#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/slack_bots").to route_to("slack_bots#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/slack_bots/1").to route_to("slack_bots#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/slack_bots/1").to route_to("slack_bots#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/slack_bots/1").to route_to("slack_bots#destroy", :id => "1")
    end

  end
end
