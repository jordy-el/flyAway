class Ticket < ApplicationRecord
  validates :price, presence: true
  belongs_to :flight
  belongs_to :passenger
end
