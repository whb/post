class Cost < ApplicationRecord
  belongs_to :payee
  belongs_to :income
  validates :sn, :payee, :income, :invoice_amount, presence: true
  validates_uniqueness_of :sn

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

  # def self.generate_sn
  #   short_year = Time.now.year.to_s[2,2]
  #   max_code = Cost.maximum("sn")
  #   if max_code && max_code.include?("C#{short_year}")
  #     num = max_code[3..-1].to_i
  #     return ("C#{short_year}%.6d") % (num + 1)
  #   else 
  #     return ("C#{short_year}%.6d") % (1)
  #   end
  # end
end
