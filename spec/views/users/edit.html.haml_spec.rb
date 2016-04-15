require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :id_slack => "MyString",
      :is_admin => false
    ))
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do

      assert_select "input#user_id_slack[name=?]", "user[id_slack]"

      assert_select "input#user_is_admin[name=?]", "user[is_admin]"
    end
  end
end
