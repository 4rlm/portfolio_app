require "application_system_test_case"

class ThermosTest < ApplicationSystemTestCase
  setup do
    @thermo = thermos(:one)
  end

  test "visiting the index" do
    visit thermos_url
    assert_selector "h1", text: "Thermos"
  end

  test "creating a Thermo" do
    visit thermos_url
    click_on "New Thermo"

    click_on "Create Thermo"

    assert_text "Thermo was successfully created"
    click_on "Back"
  end

  test "updating a Thermo" do
    visit thermos_url
    click_on "Edit", match: :first

    click_on "Update Thermo"

    assert_text "Thermo was successfully updated"
    click_on "Back"
  end

  test "destroying a Thermo" do
    visit thermos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Thermo was successfully destroyed"
  end
end
