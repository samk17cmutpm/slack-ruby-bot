require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :id_slack => "Id Slack",
      :is_admin => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Id Slack/)
    expect(rendered).to match(/false/)
  end
end
