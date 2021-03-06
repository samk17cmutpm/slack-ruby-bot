require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new(
      :id_slack => "MyString",
      :is_admin => false
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input#user_id_slack[name=?]", "user[id_slack]"

      assert_select "input#user_is_admin[name=?]", "user[is_admin]"
    end
  end
end
