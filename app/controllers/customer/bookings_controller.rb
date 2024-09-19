class Customer::BookingsController < CustomerController
  before_action :set_booking, only: %i[show edit update destroy]

  def index
    @bookings = current_customer.bookings
  end

  def show
    # Displays a single booking, so use `@booking`
  end

  def new
    @booking = current_customer.bookings.new
  end

  def create
    @booking = current_customer.bookings.new(booking_params)
    if @booking.save
      redirect_to customer_booking_url(@booking), notice: "Booking was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @booking.update(booking_params)
      redirect_to customer_booking_url(@booking), notice: "Booking was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @booking.destroy
    redirect_to customer_bookings_url, notice: "Booking was successfully destroyed."
  end

  private

  def set_booking
    @booking = current_customer.bookings.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:origin, :destination, :shipment_date, :shipment_type, :weight, :length, :width, :height, :special_instructions, :status)
  end
end
