require 'rails_helper'

RSpec.describe "slack_bots/new", type: :view do
  before(:each) do
    assign(:slack_bot, SlackBot.new(
      :token => "MyString"
    ))
  end

  it "renders new slack_bot form" do
    render

    assert_select "form[action=?][method=?]", slack_bots_path, "post" do

      assert_select "input#slack_bot_token[name=?]", "slack_bot[token]"
    end
  end
end
