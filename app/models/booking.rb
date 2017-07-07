class Booking < ApplicationRecord
  has_many :tickets
  has_one :bill
end
