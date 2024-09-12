require "application_system_test_case"

class Admin::CustomersTest < ApplicationSystemTestCase
  setup do
    @admin_customer = admin_customers(:one)
  end

  test "visiting the index" do
    visit admin_customers_url
    assert_selector "h1", text: "Customers"
  end

  test "should create customer" do
    visit admin_customers_url
    click_on "New customer"

    fill_in "Additional address", with: @admin_customer.additional_address
    fill_in "Address", with: @admin_customer.address
    fill_in "Admin email", with: @admin_customer.admin_email
    check "Approved" if @admin_customer.approved
    fill_in "City", with: @admin_customer.city
    fill_in "Company type", with: @admin_customer.company_type
    fill_in "Country", with: @admin_customer.country
    fill_in "Legal identifier type", with: @admin_customer.legal_identifier_type
    fill_in "Name", with: @admin_customer.name
    fill_in "Postal code", with: @admin_customer.postal_code
    fill_in "Shipment reference", with: @admin_customer.shipment_reference
    click_on "Create Customer"

    assert_text "Customer was successfully created"
    click_on "Back"
  end

  test "should update Customer" do
    visit admin_customer_url(@admin_customer)
    click_on "Edit this customer", match: :first

    fill_in "Additional address", with: @admin_customer.additional_address
    fill_in "Address", with: @admin_customer.address
    fill_in "Admin email", with: @admin_customer.admin_email
    check "Approved" if @admin_customer.approved
    fill_in "City", with: @admin_customer.city
    fill_in "Company type", with: @admin_customer.company_type
    fill_in "Country", with: @admin_customer.country
    fill_in "Legal identifier type", with: @admin_customer.legal_identifier_type
    fill_in "Name", with: @admin_customer.name
    fill_in "Postal code", with: @admin_customer.postal_code
    fill_in "Shipment reference", with: @admin_customer.shipment_reference
    click_on "Update Customer"

    assert_text "Customer was successfully updated"
    click_on "Back"
  end

  test "should destroy Customer" do
    visit admin_customer_url(@admin_customer)
    click_on "Destroy this customer", match: :first

    assert_text "Customer was successfully destroyed"
  end
end
