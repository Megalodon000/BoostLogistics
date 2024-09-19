# app/views/bookings/index.json.jbuilder
json.array! @bookings, partial: 'bookings/customer_booking', as: :booking
