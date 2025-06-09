require "active_support/testing/method_call_assertions"
require "application_system_test_case"

class InputTest < ApplicationSystemTestCase
  include ActiveSupport::Testing::MethodCallAssertions

  setup do
    @user = users(:one)
    @list = lists(:one)

    sign_in(@user)
  end

  test "on auto focus moves cursor to end" do
    visit edit_list_url(@list)

    position = page.evaluate_script("document.querySelector('[autofocus]').selectionStart")

    assert_equal @list.name.size, position, "Cursor should be positioned at the end of the input value"
  end
end
