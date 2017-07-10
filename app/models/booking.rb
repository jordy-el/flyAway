class Booking < ApplicationRecord
  validates :bill, presence: true
  has_many :tickets
  has_one :bill
end
