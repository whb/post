class Income < ApplicationRecord
  DISCOUNT_RATE = 1
  TAX_RATE = {"6%" => 6, "11%" => 11}
  belongs_to :payer
  has_many :costs
  validates :code, :payer, :bill_date, :income_amount, presence: true
  validates_uniqueness_of :code


  def self.fee_candidate(range)
    Income.where(bill_date: range).where.not(id: FeeDetail.select(:income_id))
  end

  def self.generate_code() 
    short_year = Time.now.year.to_s[2,2]
    max_code = Income.maximum("code")
    if max_code 
      num = max_code[3..-1].to_i
      return ("P" + short_year +"%.6d") % (num + 1)
    else 
      return ("P" + short_year +"%.6d") % (1)
    end
  end

  def self.new_blank()
    income = Income.new
    income.code = generate_code();
    income.bill_date  = Time.now.to_date
    income.discount_rate = DISCOUNT_RATE
    income
  end

  def income_available_amount
    return income_amount ? income_amount * 0.99 : 0.00
  end

  def actual_available_amount
    return actual_amount ? actual_amount * 0.99 : 0.00
  end

end
