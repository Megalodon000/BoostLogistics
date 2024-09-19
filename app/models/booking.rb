class Booking < ApplicationRecord
  belongs_to :customer
  has_many :trackings, dependent: :destroy
end
