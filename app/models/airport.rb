class Airport < ApplicationRecord
  validates :location, presence: true, uniqueness: true
  # has_many :departing, class_name: "Flight", foreign_key: "origin_id"
  # has_many :arriving, class_name: "Flight", foreign_key: "destination_id"
end
