require "application_system_test_case"

class RoombookingsTest < ApplicationSystemTestCase
  setup do
    @roombooking = roombookings(:one)
  end

  test "visiting the index" do
    visit roombookings_url
    assert_selector "h1", text: "Roombookings"
  end

  test "creating a Roombooking" do
    visit roombookings_url
    click_on "New Roombooking"

    fill_in "Endtime", with: @roombooking.endtime
    fill_in "Roomid", with: @roombooking.roomid
    fill_in "Starttime", with: @roombooking.starttime
    click_on "Create Roombooking"

    assert_text "Roombooking was successfully created"
    click_on "Back"
  end

  test "updating a Roombooking" do
    visit roombookings_url
    click_on "Edit", match: :first

    fill_in "Endtime", with: @roombooking.endtime
    fill_in "Roomid", with: @roombooking.roomid
    fill_in "Starttime", with: @roombooking.starttime
    click_on "Update Roombooking"

    assert_text "Roombooking was successfully updated"
    click_on "Back"
  end

  test "destroying a Roombooking" do
    visit roombookings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Roombooking was successfully destroyed"
  end
end
