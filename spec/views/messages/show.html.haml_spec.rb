require 'rails_helper'

RSpec.describe "messages/show", type: :view do
  before(:each) do
    @message = assign(:message, Message.create!(
      :message => "Message"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Message/)
  end
end
