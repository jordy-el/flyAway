class Flight < ApplicationRecord
  validates :departing, presence: true
  validates :seats, presence: true
  belongs_to :destination, class_name: "Airport"
  belongs_to :origin, class_name: "Airport"
end
