class Fee < ApplicationRecord
	has_many :incomes
	accepts_nested_attributes_for :incomes, :reject_if => lambda { |a| a[:selected] == 0 }

	validates :begin_date, :end_date, :part_amount1, :percent1, presence: true

	before_save :setup_incomes

	def self.new_blank()
    fee = Fee.new()
    fee.begin_date ||= Date.today.prev_month.beginning_of_month
    fee.end_date ||= Date.today.prev_month.end_of_month
    fee
  end

  def setup_incomes
  	logger.info("================5")
  	incomes.each do |income|
      if income.selected == 0
        income.fee = nil
        income.fee_amount = nil
      end
    end
   # self.incomes = self.incomes.reject {|income| income.selected == 0}
  end
end
