require "application_integration_test"

class ProfilesControllerTest < ApplicationIntegrationTest
  setup do
    @user = users(:one)

    sign_in(@user)
  end

  test "should redirect to sign in when not authenticated" do
    sign_out

    get profile_url
    assert_redirected_to new_session_url

    assert_difference("User.count", 0) do
      delete profile_url
    end
    assert_redirected_to new_session_url
  end

  test "should show user" do
    get profile_url
    assert_response :success
  end

  test "should destroy user" do
    assert_difference("User.count", -1) do
      delete profile_url
    end

    assert_redirected_to root_url
  end
end
