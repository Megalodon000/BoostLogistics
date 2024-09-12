class Admin::BookingsController < AdminController
  before_action :set_admin_booking, only: %i[show edit update destroy]

  # GET /admin/bookings
  def index
    @admin_bookings = Booking.includes(:customer).all
  end

  # GET /admin/bookings/1
  def show
  end

  # GET /admin/bookings/new
  def new
    @admin_booking = Booking.new
  end

  # POST /admin/bookings
  def create
    @admin_booking = Booking.new(booking_params)

    respond_to do |format|
      if @admin_booking.save
        format.html { redirect_to admin_booking_path(@admin_booking), notice: "Booking was successfully created." }
        format.json { render :show, status: :created, location: @admin_booking }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin_booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /admin/bookings/1/edit
  def edit
  end

  # PATCH/PUT /admin/bookings/1
  def update
    respond_to do |format|
      if @admin_booking.update(booking_params)
        format.html { redirect_to admin_booking_path(@admin_booking), notice: "Booking was successfully updated." }
        format.json { render :show, status: :ok, location: @admin_booking }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/bookings/1
  def destroy
    @admin_booking.destroy
    respond_to do |format|
      format.html { redirect_to admin_bookings_url, notice: "Booking was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_admin_booking
    @admin_booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:origin, :destination, :shipment_date, :shipment_type, :weight, :length, :width, :height, :special_instructions, :status, :customer_id)
  end
end
