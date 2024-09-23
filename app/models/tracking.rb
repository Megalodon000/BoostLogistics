class Tracking < ApplicationRecord
  belongs_to :booking
  validates :status, :location, :notes, presence: true
end
