require "active_support/testing/method_call_assertions"
require "application_system_test_case"

class ModalTest < ApplicationSystemTestCase
  include ActiveSupport::Testing::MethodCallAssertions

  setup do
    @user = users(:one)

    sign_in(@user)
  end

  test "open modal and focus correspoding input on show event" do
    visit lists_url
    click_on class: "new"

    assert_css "dialog[open]"

    assert_css "#list_name", focused: true
  end

  test "close modal on ouside click" do
    visit lists_url
    click_on class: "new"

    find("body").click

    assert_no_css "dialog[open]"
  end

  test "close modal when click on cancel button" do
    visit lists_url
    click_on class: "new"

    click_on "Cancel"

    assert_no_css "dialog[open]"
  end
end
