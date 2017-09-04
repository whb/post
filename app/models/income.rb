class Income < ApplicationRecord
  before_save :setup_fee
  DISCOUNT_RATE = 1
  TAX_RATE = {"6%" => 6, "11%" => 11}
  belongs_to :payer
  has_many :costs
  validates :code, :payer, :bill_date, :income_amount, presence: true
  validates_uniqueness_of :code


  def self.fee_candidate(range)
    Income.where(bill_date: range).where.not(id: FeeDetail.select(:income_id))
  end

  def self.new_blank()
    income = Income.new
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

  def selected=(var)
    @selected = var
    if @selected == 0
      self.fee_amount = nil
      self.fee = nil
    end
  end

  def selected
    @selected
  end

  def setup_fee
    logger.info("================3")
    if selected == 0
      fee_amount = nil
      fee = nil
      logger.info("================4")
    end
  end

end
