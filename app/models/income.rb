class Income < ApplicationRecord
  belongs_to :payer
  validates :code, :payer, :bill_date, :income_amount, presence: true
  validates_uniqueness_of :code

  def self.new_blank()
    income = Income.new
    income.bill_date  = Time.now.to_date
    income.discount_rate = 1
    income
  end
end
