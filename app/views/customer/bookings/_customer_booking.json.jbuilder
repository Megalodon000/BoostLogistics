json.extract! customer_booking, :id, :origin, :destination, :shipment_date, :shipment_type, :weight, :length, :width, :height, :special_instructions, :status, :customer_id, :created_at, :updated_at
json.url customer_booking_url(customer_booking, format: :json)
