require "application_integration_test"

class Items::ChecksControllerTest < ApplicationIntegrationTest
  setup do
    @item = items(:one)
    @user = users(:one)

    sign_in(@user)
  end

  test "change checked" do
    @item.update!(checked: false)

    patch item_check_url(@item), params: { item: { checked: true } }

    assert_redirected_to @item.list
    assert @item.reload.checked
  end
end
