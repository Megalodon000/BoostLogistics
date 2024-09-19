class Admin::TrackingsController < AdminController
  before_action :set_admin_tracking, only: %i[ show edit update destroy ]

  # GET /admin/trackings or /admin/trackings.json
  def index
    @admin_trackings = Tracking.all
  end

  # GET /admin/trackings/1 or /admin/trackings/1.json
  def show
  end

  # GET /admin/trackings/new
  def new
    @admin_tracking = Tracking.new
  end

  # GET /admin/trackings/1/edit
  def edit
  end

  # POST /admin/trackings or /admin/trackings.json
  def create
    @admin_tracking = Tracking.new(admin_tracking_params)

    respond_to do |format|
      if @admin_tracking.save
        format.html { redirect_to admin_tracking_url(@admin_tracking), notice: "Tracking was successfully created." }
        format.json { render :show, status: :created, location: @admin_tracking }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin_tracking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/trackings/1 or /admin/trackings/1.json
  def update
    respond_to do |format|
      if @admin_tracking.update(admin_tracking_params)
        format.html { redirect_to admin_tracking_url(@admin_tracking), notice: "Tracking was successfully updated." }
        format.json { render :show, status: :ok, location: @admin_tracking }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_tracking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/trackings/1 or /admin/trackings/1.json
  def destroy
    @admin_tracking.destroy!

    respond_to do |format|
      format.html { redirect_to admin_trackings_url, notice: "Tracking was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_tracking
      @admin_tracking = Tracking.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_tracking_params
      params.require(:tracking).permit(:status, :location, :notes, :booking_id)
    end
end
