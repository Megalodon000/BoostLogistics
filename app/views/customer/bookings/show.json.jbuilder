# app/views/bookings/show.json.jbuilder
json.partial! 'bookings/customer_booking', booking: @booking
