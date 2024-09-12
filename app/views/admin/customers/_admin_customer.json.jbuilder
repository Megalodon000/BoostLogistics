json.extract! admin_customer, :id, :name, :address, :company_type, :additional_address, :city, :postal_code, :country, :legal_identifier_type, :shipment_reference, :admin_email, :approved, :created_at, :updated_at
json.url admin_customer_url(admin_customer, format: :json)
