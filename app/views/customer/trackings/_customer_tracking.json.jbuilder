json.extract! customer_tracking, :id, :status, :location, :notes, :booking_id, :created_at, :updated_at
json.url customer_tracking_url(customer_tracking, format: :json)
