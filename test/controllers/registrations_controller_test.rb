require "test_helper"

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_registration_url
    assert_response :success
  end

  test "should create registration" do
    assert_difference("User.count") do
      post registration_url, params: {
        user: {
          email_address: "test@example.com",
          password: "testtest",
          password_confirmation: "testtest",
          terms_confirmed: true
        }
      }
    end

    assert_redirected_to lists_url
  end
end
