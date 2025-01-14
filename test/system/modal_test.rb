require "application_system_test_case"

class ModalTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)

    sign_in(@user)
  end

  test "close modal on ouside click" do
    visit lists_url
    click_on class: "new"

    find("body").click

    assert_no_css "dialog"
  end
end
