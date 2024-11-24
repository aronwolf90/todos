require "test_helper"

class ItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @list = lists(:one)
    @item = items(:one)
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

  test "should update item" do
    patch item_url(@item), params: { item: { name: @item.name } }
    assert_redirected_to list_url(@item.list)
  end

  test "should destroy item" do
    assert_difference("Item.count", -1) do
      delete item_url(@item)
    end

    assert_redirected_to list_url(@item)
  end
end
