require 'rails_helper'

RSpec.describe "slack_bots/edit", type: :view do
  before(:each) do
    @slack_bot = assign(:slack_bot, SlackBot.create!(
      :token => "MyString"
    ))
  end

  it "renders the edit slack_bot form" do
    render

    assert_select "form[action=?][method=?]", slack_bot_path(@slack_bot), "post" do

      assert_select "input#slack_bot_token[name=?]", "slack_bot[token]"
    end
  end
end
