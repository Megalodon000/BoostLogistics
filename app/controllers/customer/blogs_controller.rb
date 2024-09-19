class Customer::BlogsController < CustomerController
  before_action :set_blog, only: %i[show]

  def index
    @blogs = Blog.all
  end

  def show
    # Displays a single blog, so use `@blog`
  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
  end
end
