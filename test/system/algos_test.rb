require "application_system_test_case"

class AlgosTest < ApplicationSystemTestCase
  setup do
    @algo = algos(:one)
  end

  test "visiting the index" do
    visit algos_url
    assert_selector "h1", text: "Algos"
  end

  test "creating a Algo" do
    visit algos_url
    click_on "New Algo"

    click_on "Create Algo"

    assert_text "Algo was successfully created"
    click_on "Back"
  end

  test "updating a Algo" do
    visit algos_url
    click_on "Edit", match: :first

    click_on "Update Algo"

    assert_text "Algo was successfully updated"
    click_on "Back"
  end

  test "destroying a Algo" do
    visit algos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Algo was successfully destroyed"
  end
end
