require "test_helper"

class ModalHelperTest < ActionView::TestCase
  test "modal_close_button returns resume_historical_location link on hotwire native app" do
    request.user_agent += ";overflow-menu"

    html = controller.helpers.modal_close_button

    assert_includes html, "resume_historical_location"
    assert_includes html, "<a"
  end

  test "modal_close_button returns a button when it is inside a web modal" do
    request.headers["Turbo-Frame"] = "modal"

    assert_includes controller.helpers.modal_close_button, "button"
  end

  test "modal_close_button returns link to previous page when open in normal page" do
    request.headers["HTTP_REFERER"] = "http://previous.com"

    html = controller.helpers.modal_close_button

    assert_includes html, "previous.com"
    assert_includes html, "<a"
  end
end
