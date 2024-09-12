require "test_helper"

class Admin::BookingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_booking = admin_bookings(:one)
  end

  test "should get index" do
    get admin_bookings_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_booking_url
    assert_response :success
  end

  test "should create admin_booking" do
    assert_difference("Admin::Booking.count") do
      post admin_bookings_url, params: { admin_booking: { customer_id: @admin_booking.customer_id, destination: @admin_booking.destination, height: @admin_booking.height, length: @admin_booking.length, origin: @admin_booking.origin, shipment_date: @admin_booking.shipment_date, shipment_type: @admin_booking.shipment_type, special_instructions: @admin_booking.special_instructions, status: @admin_booking.status, weight: @admin_booking.weight, width: @admin_booking.width } }
    end

    assert_redirected_to admin_booking_url(Admin::Booking.last)
  end

  test "should show admin_booking" do
    get admin_booking_url(@admin_booking)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_booking_url(@admin_booking)
    assert_response :success
  end

  test "should update admin_booking" do
    patch admin_booking_url(@admin_booking), params: { admin_booking: { customer_id: @admin_booking.customer_id, destination: @admin_booking.destination, height: @admin_booking.height, length: @admin_booking.length, origin: @admin_booking.origin, shipment_date: @admin_booking.shipment_date, shipment_type: @admin_booking.shipment_type, special_instructions: @admin_booking.special_instructions, status: @admin_booking.status, weight: @admin_booking.weight, width: @admin_booking.width } }
    assert_redirected_to admin_booking_url(@admin_booking)
  end

  test "should destroy admin_booking" do
    assert_difference("Admin::Booking.count", -1) do
      delete admin_booking_url(@admin_booking)
    end

    assert_redirected_to admin_bookings_url
  end
end
