json.extract! admin_tracking, :id, :status, :location, :notes, :booking_id, :created_at, :updated_at
json.url admin_tracking_url(admin_tracking, format: :json)
