class Customer::BookingsController < CustomerController
  before_action :authenticate_customer!
  before_action :set_customer_booking, only: %i[show edit update destroy]

  # GET /customer/bookings or /customer/bookings.json
  def index
    @customer_bookings = current_customer.bookings
  end

  # GET /customer/bookings/1 or /customer/bookings/1.json
  def show
    @customer_trackings = @customer_booking.trackings if @customer_booking.customer == current_customer
  end

  # GET /customer/bookings/new
  def new
    @customer_booking = current_customer.bookings.new
  end

  # GET /customer/bookings/1/edit
  def edit
    redirect_to customer_bookings_path, alert: "Not authorized" unless @customer_booking.customer == current_customer
  end

  # POST /customer/bookings or /customer/bookings.json
  def create
    @customer_booking = current_customer.bookings.new(customer_booking_params)

    respond_to do |format|
      if @customer_booking.save
        format.html { redirect_to customer_booking_url(@customer_booking), notice: "Booking was successfully created." }
        format.json { render :show, status: :created, location: @customer_booking }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @customer_booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customer/bookings/1 or /customer/bookings/1.json
  def update
    respond_to do |format|
      if @customer_booking.update(customer_booking_params)
        format.html { redirect_to customer_booking_url(@customer_booking), notice: "Booking was successfully updated." }
        format.json { render :show, status: :ok, location: @customer_booking }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @customer_booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customer/bookings/1 or /customer/bookings/1.json
  def destroy
    if @customer_booking.customer == current_customer
      @customer_booking.destroy!
      respond_to do |format|
        format.html { redirect_to customer_bookings_url, notice: "Booking was successfully destroyed." }
        format.json { head :no_content }
      end
    else
      redirect_to customer_bookings_path, alert: "Not authorized to delete this booking."
    end
  end

  private

    def set_customer_booking
      @customer_booking = current_customer.bookings.find_by(id: params[:id])
      if @customer_booking.nil?
        redirect_to customer_bookings_path, alert: "Booking not found or not authorized."
      end
    end

    def customer_booking_params
      params.require(:booking).permit(:origin, :destination, :shipment_date, :shipment_type, :weight, :length, :width, :height, :special_instructions)
    end
end
