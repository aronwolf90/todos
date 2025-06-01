require "application_integration_test"

class ListsControllerTest < ApplicationIntegrationTest
  setup do
    @list = lists(:one)
    @user = users(:one)

    sign_in(@user)
  end

  test "should get index" do
    List.create!(name: "new", user: @user)

    get lists_url

    assert_response :success

    assert_select "main li:nth-of-type(1) a", "new"
    assert_select "main li:nth-of-type(2) a", "two"
    assert_select "main li:nth-of-type(3) a", "one"
    assert_not_includes response.body, "third"
  end

  test "should get new" do
    get new_list_url
    assert_response :success
  end

  test "should create list" do
    assert_difference("@user.reload.lists.count") do
      post lists_url, params: { list: { name: @list.name } }
    end

    assert_redirected_to lists_url
  end

  test "should show list" do
    Item.create!(name: "new", list: @list)

    get list_url(@list)
    assert_response :success

    assert_select "main li:first-of-type [data-test='item-name']", "new"
  end

  test "should get edit" do
    get edit_list_url(@list)
    assert_response :success
  end

  test "should update list" do
    patch list_url(@list), params: { list: { name: @list.name } }

    assert_redirected_to lists_url
  end

  test "should destroy list" do
    assert_difference("List.count", -1) do
      delete list_url(@list)
    end

    assert_redirected_to lists_url
  end
end
