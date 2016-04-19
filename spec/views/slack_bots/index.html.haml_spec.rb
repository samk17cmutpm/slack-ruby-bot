require 'rails_helper'

RSpec.describe "slack_bots/index", type: :view do
  before(:each) do
    assign(:slack_bots, [
      SlackBot.create!(
        :token => "Token"
      ),
      SlackBot.create!(
        :token => "Token"
      )
    ])
  end

  it "renders a list of slack_bots" do
    render
    assert_select "tr>td", :text => "Token".to_s, :count => 2
  end
end
