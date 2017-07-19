class Cost < ApplicationRecord
  belongs_to :payee
  belongs_to :income

  def self.new_blank(income)
    cost = Cost.new
    cost.income = income
    cost.tax_rate = income.tax_rate
    cost
  end
end
