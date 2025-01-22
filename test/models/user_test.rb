require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "checks that password and password_confirmation matches" do
    user = User.new(
      email_address: "test@example.com",
      password: "testtest",
      password_confirmation: "testtest"
    )

    assert user.valid?

    user.password_confirmation = "invalid"
    assert user.invalid?
  end

  test "#items" do
    assert_includes users(:one).items, items(:one)
    assert_not_includes users(:one).items, items(:third)
  end
end
