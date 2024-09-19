class Admin::BookingsController < AdminController
  before_action :set_admin_booking, only: %i[show edit update destroy]

  # GET /admin/bookings or /admin/bookings.json
  def index
    @admin_bookings = Booking.all
  end

  # GET /admin/bookings/1 or /admin/bookings/1.json
  def show
    @admin_trackings = @admin_booking.trackings
  end

  # GET /admin/bookings/new
  def new
    @admin_booking = Booking.new
  end

  # GET /admin/bookings/1/edit
  def edit
  end

  # POST /admin/bookings or /admin/bookings.json
  def create
    @admin_booking = Booking.new(admin_booking_params)

    respond_to do |format|
      if @admin_booking.save
        format.html { redirect_to admin_booking_url(@admin_booking), notice: "Booking was successfully created." }
        format.json { render :show, status: :created, location: @admin_booking }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin_booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/bookings/1 or /admin/bookings/1.json
  def update
    respond_to do |format|
      if @admin_booking.update(admin_booking_params)
        format.html { redirect_to admin_booking_url(@admin_booking), notice: "Booking was successfully updated." }
        format.json { render :show, status: :ok, location: @admin_booking }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/bookings/1 or /admin/bookings/1.json
  def destroy
    @admin_booking.destroy!

    respond_to do |format|
      format.html { redirect_to admin_bookings_url, notice: "Booking was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_admin_booking
      @admin_booking = Booking.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_booking_params
      params.require(:booking).permit(:origin, :destination, :shipment_date, :shipment_type, :weight, :length, :width, :height, :special_instructions, :status)
    end
end
