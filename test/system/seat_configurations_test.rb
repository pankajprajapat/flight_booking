require "application_system_test_case"

class SeatConfigurationsTest < ApplicationSystemTestCase
  setup do
    @seat_configuration = seat_configurations(:one)
  end

  test "visiting the index" do
    visit seat_configurations_url
    assert_selector "h1", text: "Seat Configurations"
  end

  test "creating a Seat configuration" do
    visit seat_configurations_url
    click_on "New Seat Configuration"

    fill_in "Category", with: @seat_configuration.category_id
    fill_in "Number of rows", with: @seat_configuration.number_of_rows
    fill_in "Plane", with: @seat_configuration.plane_id
    fill_in "Seats in row", with: @seat_configuration.seats_in_row
    click_on "Create Seat configuration"

    assert_text "Seat configuration was successfully created"
    click_on "Back"
  end

  test "updating a Seat configuration" do
    visit seat_configurations_url
    click_on "Edit", match: :first

    fill_in "Category", with: @seat_configuration.category_id
    fill_in "Number of rows", with: @seat_configuration.number_of_rows
    fill_in "Plane", with: @seat_configuration.plane_id
    fill_in "Seats in row", with: @seat_configuration.seats_in_row
    click_on "Update Seat configuration"

    assert_text "Seat configuration was successfully updated"
    click_on "Back"
  end

  test "destroying a Seat configuration" do
    visit seat_configurations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Seat configuration was successfully destroyed"
  end
end
