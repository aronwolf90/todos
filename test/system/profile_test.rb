require "application_system_test_case"

class ProfileTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)

    sign_in(@user)
  end

  test "should destroy User" do
    visit profile_url
    click_on "Delete account", match: :first

    page.driver.browser.switch_to.alert.accept

    assert_text "All your data was successfully destroyed."
    assert_not User.exists?(@user.id)
  end
end
