class Customer::TrackingsController < CustomerController
  before_action :set_tracking, only: %i[show]

  def index
    @customer_trackings = current_customer.trackings
  end

  def show
    # Displays a single tracking, so use `@tracking`
  end

  private

  def set_tracking
    @customer_tracking = Tracking.find(params[:id])
  end
end
