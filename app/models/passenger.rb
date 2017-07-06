class Passenger < ApplicationRecord
  validates :name, presence: true
end
