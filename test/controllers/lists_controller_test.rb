require "application_integration_test"

class ListsControllerTest < ApplicationIntegrationTest
  setup do
    @list = lists(:one)
    @user = users(:one)

    sign_in(@user)
  end

  test "should get index" do
    get lists_url
    assert_response :success
  end

  test "should get new" do
    get new_list_url
    assert_response :success
  end

  test "should create list" do
    assert_difference("@user.reload.lists.count") do
      post lists_url, params: { list: { name: @list.name } }
    end

    assert_turbo_stream action: :refresh
  end

  test "should show list" do
    get list_url(@list)
    assert_response :success
  end

  test "should get edit" do
    get edit_list_url(@list)
    assert_response :success
  end

  test "should update list" do
    patch list_url(@list), params: { list: { name: @list.name } }

    assert_turbo_stream action: :refresh
  end

  test "should destroy list" do
    assert_difference("List.count", -1) do
      delete list_url(@list)
    end

    assert_redirected_to lists_url
  end
end
