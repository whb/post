class Revenue < ApplicationRecord
  belongs_to :income
  validates :date, :amount, presence: true
end
