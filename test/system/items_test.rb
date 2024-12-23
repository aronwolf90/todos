require "application_system_test_case"

class ItemsTest < ApplicationSystemTestCase
  setup do
    @list = lists(:one)
    @item = items(:one)
    @user = users(:one)

    sign_in(@user)
  end

  test "should create item" do
    visit list_url(@list)
    click_on class: "new"

    fill_in "Name", with: @item.name
    click_on "Create Item"

    assert_text "Item was successfully created"
  end

  test "should update Item" do
    visit list_url(@item.list)

    within "ul" do
      click_on class: "dots-menu", match: :first
      click_on class: "edit", match: :first
    end

    fill_in "Name", with: @item.name
    click_on "Update Item"

    assert_text "Item was successfully updated"
  end

  test "should check item when click on checked" do
    visit list_url(@item.list)

    within ".items > li", match: :first do
      check "item[checked]"

      slow_connection do
        assert_selector ".status:not(.hidden)"
      end

      wait_until do
        @item.reload.checked
      end
    end
  end

  test "should destroy Item" do
    visit list_url(@item.list)

    within "ul" do
      click_on class: "dots-menu", match: :first
      click_on class: "destroy", match: :first
    end

    assert_text "Item was successfully destroyed"
  end
end
