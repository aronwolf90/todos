require "application_integration_test"

class ItemsControllerTest < ApplicationIntegrationTest
  setup do
    @list = lists(:one)
    @item = items(:one)
    @user = users(:one)

    sign_in(@user)
  end

  test "should get new" do
    get new_list_item_url(@item.list, @item)
    assert_response :success
  end

  test "should create item" do
    assert_difference("Item.count") do
      post list_items_url(@list), params: { item: { name: @item.name } }
    end

    assert_redirected_to list_url(@list)
  end

  test "should get edit" do
    get edit_item_url(@item)
    assert_response :success
  end

  test "should update item with flash message" do
    patch item_url(@item), params: { item: { name: "new name" } }

    assert_redirected_to list_url(@item.list)
    assert_equal @item.reload.name, "new name"
    assert_equal "Item was successfully updated.", flash["notice"]
  end

  test "should update without flash when no_flash == 1" do
    patch item_url(@item), params: { item: { checked: true }, no_flash: 1 }

    assert_redirected_to list_url(@item.list)
    assert_equal @item.reload.checked, true
    assert_nil flash["notice"]
  end

  test "should destroy item" do
    assert_difference("Item.count", -1) do
      delete item_url(@item)
    end

    assert_redirected_to list_url(@item)
  end
end
