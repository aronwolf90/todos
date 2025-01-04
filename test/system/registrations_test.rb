require "application_system_test_case"

class RegistrationsTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test "should create user" do
    visit new_registration_url

    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "testtest"
    fill_in "Password confirmation", with: "testtest"
    click_on "Create account"

    assert_text "Registered successfully."
  end

  test "when form is invalid, shows error" do
    visit new_registration_url

    fill_in "Email", with: @user.email_address
    fill_in "Password", with: "testtest"
    fill_in "Password confirmation", with: "testtest"
    click_on "Create account"

    assert_text "Email address has already been taken"
  end
end
