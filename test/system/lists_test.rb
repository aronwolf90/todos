require "application_system_test_case"

class ListsTest < ApplicationSystemTestCase
  setup do
    @list = lists(:one)
  end

  test "visiting the index" do
    visit lists_url
    assert_selector "h1", text: "Lists"
  end

  test "should create list" do
    visit lists_url
    click_on "New list"

    fill_in "Name", with: @list.name
    click_on "Create List"

    assert_text "List was successfully created"
  end

  test "should update List" do
    visit lists_url
    click_on class: "edit", match: :first

    fill_in "Name", with: @list.name
    click_on "Update List"

    assert_text "List was successfully updated"
  end

  test "should destroy List" do
    visit lists_url
    click_on class: "destroy", match: :first

    assert_text "List was successfully destroyed"
  end
end