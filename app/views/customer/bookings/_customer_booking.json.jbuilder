# app/views/bookings/_customer_booking.json.jbuilder
json.extract! booking, :id, :origin, :destination, :shipment_date, :shipment_type, :weight, :length, :width, :height, :special_instructions, :status
json.url booking_url(booking, format: :json)
