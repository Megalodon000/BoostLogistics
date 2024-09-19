json.extract! customer_blog, :id, :title, :content, :image, :created_at, :updated_at
json.url customer_blog_url(customer_blog, format: :json)
