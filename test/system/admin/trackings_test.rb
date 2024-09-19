require "application_system_test_case"

class Admin::TrackingsTest < ApplicationSystemTestCase
  setup do
    @admin_tracking = admin_trackings(:one)
  end

  test "visiting the index" do
    visit admin_trackings_url
    assert_selector "h1", text: "Trackings"
  end

  test "should create tracking" do
    visit admin_trackings_url
    click_on "New tracking"

    fill_in "Booking", with: @admin_tracking.booking_id
    fill_in "Location", with: @admin_tracking.location
    fill_in "Notes", with: @admin_tracking.notes
    fill_in "Status", with: @admin_tracking.status
    click_on "Create Tracking"

    assert_text "Tracking was successfully created"
    click_on "Back"
  end

  test "should update Tracking" do
    visit admin_tracking_url(@admin_tracking)
    click_on "Edit this tracking", match: :first

    fill_in "Booking", with: @admin_tracking.booking_id
    fill_in "Location", with: @admin_tracking.location
    fill_in "Notes", with: @admin_tracking.notes
    fill_in "Status", with: @admin_tracking.status
    click_on "Update Tracking"

    assert_text "Tracking was successfully updated"
    click_on "Back"
  end

  test "should destroy Tracking" do
    visit admin_tracking_url(@admin_tracking)
    click_on "Destroy this tracking", match: :first

    assert_text "Tracking was successfully destroyed"
  end
end
