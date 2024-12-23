require "application_system_test_case"

class SessionTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test "signin in and signout" do
    visit root_url

    fill_in "email_address", with: @user.email_address
    fill_in "password", with: "password"
    click_on "Sign in"

    assert_text "Lists"

    click_on id: "main-menu"
    click_on "Sign out"

    assert_text "Sign in"
  end
end
