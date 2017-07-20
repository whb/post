class Income < ApplicationRecord
  DISCOUNT_RATE = 1
  TAX_RATE = {"6%" => 6, "11%" => 11}
  belongs_to :payer
  has_many :costs
  validates :code, :payer, :bill_date, :income_amount, presence: true
  validates_uniqueness_of :code

  def self.new_blank()
    income = Income.new
    income.bill_date  = Time.now.to_date
    income.discount_rate = DISCOUNT_RATE
    income
  end

  def income_available_amount
    income_amount * (1 - DISCOUNT_RATE/100)
  end

  def actual_available_amount
    actual_amount * (1 - DISCOUNT_RATE/100)
  end
end
