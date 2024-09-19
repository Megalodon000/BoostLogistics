require "test_helper"

class Admin::TrackingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_tracking = admin_trackings(:one)
  end

  test "should get index" do
    get admin_trackings_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_tracking_url
    assert_response :success
  end

  test "should create admin_tracking" do
    assert_difference("Admin::Tracking.count") do
      post admin_trackings_url, params: { admin_tracking: { booking_id: @admin_tracking.booking_id, location: @admin_tracking.location, notes: @admin_tracking.notes, status: @admin_tracking.status } }
    end

    assert_redirected_to admin_tracking_url(Admin::Tracking.last)
  end

  test "should show admin_tracking" do
    get admin_tracking_url(@admin_tracking)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_tracking_url(@admin_tracking)
    assert_response :success
  end

  test "should update admin_tracking" do
    patch admin_tracking_url(@admin_tracking), params: { admin_tracking: { booking_id: @admin_tracking.booking_id, location: @admin_tracking.location, notes: @admin_tracking.notes, status: @admin_tracking.status } }
    assert_redirected_to admin_tracking_url(@admin_tracking)
  end

  test "should destroy admin_tracking" do
    assert_difference("Admin::Tracking.count", -1) do
      delete admin_tracking_url(@admin_tracking)
    end

    assert_redirected_to admin_trackings_url
  end
end
