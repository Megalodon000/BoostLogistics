require "test_helper"

class Admin::CustomersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_customer = admin_customers(:one)
  end

  test "should get index" do
    get admin_customers_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_customer_url
    assert_response :success
  end

  test "should create admin_customer" do
    assert_difference("Admin::Customer.count") do
      post admin_customers_url, params: { admin_customer: { additional_address: @admin_customer.additional_address, address: @admin_customer.address, admin_email: @admin_customer.admin_email, approved: @admin_customer.approved, city: @admin_customer.city, company_type: @admin_customer.company_type, country: @admin_customer.country, legal_identifier_type: @admin_customer.legal_identifier_type, name: @admin_customer.name, postal_code: @admin_customer.postal_code, shipment_reference: @admin_customer.shipment_reference } }
    end

    assert_redirected_to admin_customer_url(Admin::Customer.last)
  end

  test "should show admin_customer" do
    get admin_customer_url(@admin_customer)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_customer_url(@admin_customer)
    assert_response :success
  end

  test "should update admin_customer" do
    patch admin_customer_url(@admin_customer), params: { admin_customer: { additional_address: @admin_customer.additional_address, address: @admin_customer.address, admin_email: @admin_customer.admin_email, approved: @admin_customer.approved, city: @admin_customer.city, company_type: @admin_customer.company_type, country: @admin_customer.country, legal_identifier_type: @admin_customer.legal_identifier_type, name: @admin_customer.name, postal_code: @admin_customer.postal_code, shipment_reference: @admin_customer.shipment_reference } }
    assert_redirected_to admin_customer_url(@admin_customer)
  end

  test "should destroy admin_customer" do
    assert_difference("Admin::Customer.count", -1) do
      delete admin_customer_url(@admin_customer)
    end

    assert_redirected_to admin_customers_url
  end
end
