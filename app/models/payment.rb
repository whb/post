class Payment < ApplicationRecord
  belongs_to :cost
  validates :date, :amount, presence: true
end
