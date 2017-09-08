class Cost < ApplicationRecord
  belongs_to :payee
  belongs_to :income
  has_many :payments, -> { order(:date) }, dependent: :destroy
  accepts_nested_attributes_for :payments, allow_destroy: true

  validates :sn, :payee, :income, :invoice_amount, presence: true
  validates_uniqueness_of :sn

  before_save do
    self.cost_amount = payments.reject{|r| r.marked_for_destruction?}.map(&:amount).compact.sum
    self.cost_date = payments.reject{|r| r.marked_for_destruction?}.map(&:date).compact.max
  end

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
