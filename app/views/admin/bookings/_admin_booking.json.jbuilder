json.extract! admin_booking, :id, :origin, :destination, :shipment_date, :shipment_type, :weight, :length, :width, :height, :special_instructions, :status, :customer_id, :created_at, :updated_at
json.url admin_booking_url(admin_booking, format: :json)
