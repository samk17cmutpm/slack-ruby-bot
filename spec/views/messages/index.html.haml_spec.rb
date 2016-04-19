require 'rails_helper'

RSpec.describe "messages/index", type: :view do
  before(:each) do
    assign(:messages, [
      Message.create!(
        :message => "Message"
      ),
      Message.create!(
        :message => "Message"
      )
    ])
  end

  it "renders a list of messages" do
    render
    assert_select "tr>td", :text => "Message".to_s, :count => 2
  end
end
