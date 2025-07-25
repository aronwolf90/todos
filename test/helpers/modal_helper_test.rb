require "test_helper"

class ModalHelperTest < ActionView::TestCase
  test "modal_close_button returns turbo_resume_historical_location_url link on hotwire native app" do
    request.user_agent += "feature-flag-native-modals;"

    assert_nil controller.helpers.modal_close_button
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
