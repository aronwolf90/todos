require "application_system_test_case"

class RegistrationsTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test "should create user" do
    visit root_url
    click_on "Sign up"

    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "testtest"
    fill_in "Password confirmation", with: "testtest"
    check "I agree to the Terms of Service and Privacy Policy"
    click_on "Create account"

    assert_text "Registered successfully."
  end

  test "when form is invalid, shows error" do
    visit root_url
    click_on "Sign up"

    fill_in "Email", with: @user.email_address
    fill_in "Password", with: "testtest"
    fill_in "Password confirmation", with: "testtest"
    click_on "Create account"

    assert_text "Email address has already been taken"
  end
end
