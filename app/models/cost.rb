class Cost < ApplicationRecord
  belongs_to :payee
  belongs_to :income

  def self.new_blank(income)
    cost = Cost.new
    cost.sn = Cost.generate_sn
    cost.income = income
    cost.tax_rate = income.tax_rate
    cost
  end

  def unpaid_amount
  	cost_amount ? invoice_amount - cost_amount : invoice_amount
  end

  def self.generate_sn
    max_id = Cost.maximum('id') ? Cost.maximum('id') : 0
    "cst-%.6d" % (max_id + 1)
  end
end
