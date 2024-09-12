require "application_system_test_case"

class Admin::BookingsTest < ApplicationSystemTestCase
  setup do
    @admin_booking = admin_bookings(:one)
  end

  test "visiting the index" do
    visit admin_bookings_url
    assert_selector "h1", text: "Bookings"
  end

  test "should create booking" do
    visit admin_bookings_url
    click_on "New booking"

    fill_in "Customer", with: @admin_booking.customer_id
    fill_in "Destination", with: @admin_booking.destination
    fill_in "Height", with: @admin_booking.height
    fill_in "Length", with: @admin_booking.length
    fill_in "Origin", with: @admin_booking.origin
    fill_in "Shipment date", with: @admin_booking.shipment_date
    fill_in "Shipment type", with: @admin_booking.shipment_type
    fill_in "Special instructions", with: @admin_booking.special_instructions
    fill_in "Status", with: @admin_booking.status
    fill_in "Weight", with: @admin_booking.weight
    fill_in "Width", with: @admin_booking.width
    click_on "Create Booking"

    assert_text "Booking was successfully created"
    click_on "Back"
  end

  test "should update Booking" do
    visit admin_booking_url(@admin_booking)
    click_on "Edit this booking", match: :first

    fill_in "Customer", with: @admin_booking.customer_id
    fill_in "Destination", with: @admin_booking.destination
    fill_in "Height", with: @admin_booking.height
    fill_in "Length", with: @admin_booking.length
    fill_in "Origin", with: @admin_booking.origin
    fill_in "Shipment date", with: @admin_booking.shipment_date
    fill_in "Shipment type", with: @admin_booking.shipment_type
    fill_in "Special instructions", with: @admin_booking.special_instructions
    fill_in "Status", with: @admin_booking.status
    fill_in "Weight", with: @admin_booking.weight
    fill_in "Width", with: @admin_booking.width
    click_on "Update Booking"

    assert_text "Booking was successfully updated"
    click_on "Back"
  end

  test "should destroy Booking" do
    visit admin_booking_url(@admin_booking)
    click_on "Destroy this booking", match: :first

    assert_text "Booking was successfully destroyed"
  end
end
