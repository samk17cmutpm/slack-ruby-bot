require 'rails_helper'

RSpec.describe "slack_bots/show", type: :view do
  before(:each) do
    @slack_bot = assign(:slack_bot, SlackBot.create!(
      :token => "Token"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Token/)
  end
end
