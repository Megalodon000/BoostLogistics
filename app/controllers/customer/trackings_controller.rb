class Customer::TrackingsController < CustomerController
  before_action :set_tracking, only: %i[show]

  def index
    @trackings = current_customer.trackings
  end

  def show
    # Displays a single tracking, so use `@tracking`
  end

  private

  def set_tracking
    @tracking = Tracking.find(params[:id])
  end
end
