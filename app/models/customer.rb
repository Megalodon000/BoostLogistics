class Customer < ApplicationRecord
  validates :name, :address, :company_type, :city, :postal_code, :country, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, allow_blank: true
end
