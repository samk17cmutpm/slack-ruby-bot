require 'rails_helper'

RSpec.describe "SlackBots", type: :request do
  describe "GET /slack_bots" do
    it "works! (now write some real specs)" do
      get slack_bots_path
      expect(response).to have_http_status(200)
    end
  end
end
