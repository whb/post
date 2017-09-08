class Income < ApplicationRecord
  DISCOUNT_RATE = 1
  TAX_RATE = {"6%" => 6, "11%" => 11}
  belongs_to :payer
  has_many :costs
  has_many :fee_details
  has_many :revenues, -> { order(:date) }, dependent: :destroy
  accepts_nested_attributes_for :revenues, allow_destroy: true, reject_if: :all_blank

  validates :code, :payer, :bill_date, :income_amount, presence: true
  validates_uniqueness_of :code
  validate :actual_amount_cannot_be_greater_than_income_amount

  before_validation do
    self.actual_amount = revenues.reject{|r| r.marked_for_destruction?}.map(&:amount).compact.sum
    self.actual_date = revenues.reject{|r| r.marked_for_destruction?}.map(&:date).compact.max
  end

  def actual_amount_cannot_be_greater_than_income_amount
    if actual_amount > income_amount
      errors.add(:income_amount, :actual_amount_cannot_be_greater_than_income_amount)
      revenues.each do |r| 
        r.errors.add(:amount, :actual_amount_cannot_be_greater_than_income_amount)
      end
    end
  end

  def self.fee_candidate(range)
    Income.where(bill_date: range).where.not(id: FeeDetail.select(:income_id))
  end

  def self.generate_code
    short_year = Time.now.year.to_s[2,2]
    max_code = Income.maximum("code")
    if max_code && max_code.include?("P#{short_year}")
      num = max_code[3..-1].to_i
      return ("P#{short_year}%.6d") % (num + 1)
    else 
      return ("P#{short_year}%.6d") % (1)
    end
  end

  def self.new_blank
    income = Income.new
    income.code = generate_code;
    income.bill_date  = Time.now.to_date
    income.discount_rate = DISCOUNT_RATE
    income
  end

  def feed?
    @feed ||= cal_feed?
  end

  def cal_feed?
    self.fee_details.first ? true : false
  end

  def fee_amount
    @fee_amount ||= cal_fee_amount
  end

  def cal_fee_amount
    fee_detail = self.fee_details.first
    if fee_detail && fee_detail.fee_amount
      return fee_detail.fee_amount
    else 
      return 0.00
    end
  end

  def income_available_amount
    return 0.00 unless income_amount
    return income_amount unless feed?
    return income_amount - fee_amount
  end

  def actual_available_amount
    return 0.00 unless actual_amount
    return [income_available_amount, actual_amount].min
  end

  def cost_amount
    costs.reduce(0.00) { |sum, cost| sum + cost.invoice_amount}
  end

  def actual_cost_amount
    costs.reduce(0.00) { |sum, cost| sum + (cost.cost_amount ? cost.cost_amount : 0.0)}
  end
end
