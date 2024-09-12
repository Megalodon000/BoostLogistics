class Admin::CustomersController < AdminController
  before_action :set_admin_customer, only: %i[ show edit update destroy approve reject ]

  # GET /admin/customers or /admin/customers.json
  def index
    @admin_customers = Customer.all
  end

  # GET /admin/customers/1 or /admin/customers/1.json
  def show
  end

  # GET /admin/customers/new
  def new
    @admin_customer = Customer.new
  end

  # GET /admin/customers/1/edit
  def edit
  end

  # POST /admin/customers or /admin/customers.json
  def create
    @admin_customer = Customer.new(admin_customer_params)

    respond_to do |format|
      if @admin_customer.save
        format.html { redirect_to admin_customer_url(@admin_customer), notice: "Customer was successfully created." }
        format.json { render :show, status: :created, location: @admin_customer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin_customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/customers/1 or /admin/customers/1.json
  def update
    respond_to do |format|
      if @admin_customer.update(admin_customer_params)
        format.html { redirect_to admin_customer_url(@admin_customer), notice: "Customer was successfully updated." }
        format.json { render :show, status: :ok, location: @admin_customer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/customers/1 or /admin/customers/1.json
  def destroy
    @admin_customer.destroy!

    respond_to do |format|
      format.html { redirect_to admin_customers_url, notice: "Customer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # PATCH/PUT /admin/customers/1/approve
  def approve
    @admin_customer.update(approved: true)
    redirect_to admin_customers_url, notice: "Customer was successfully approved."
  end

  # PATCH/PUT /admin/customers/1/reject
  def reject
    @admin_customer.update(approved: false)
    redirect_to admin_customers_url, notice: "Customer was successfully rejected."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_customer
      @admin_customer = Customer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_customer_params
      params.require(:customer).permit(:name, :address, :company_type, :additional_address, :city, :postal_code, :country, :legal_identifier_type, :shipment_reference, :admin_email, :approved)
    end
end
