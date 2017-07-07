class Passenger < ApplicationRecord
  validates :name, presence: true
  has_one :bill
  has_many :tickets
end
