class Bill < ApplicationRecord
  validates :address, presence: true
  validates :phone, presence: true, format: { with: /\A[0-9]+\z/ }
  belongs_to :booking
end
