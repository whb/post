class Fee < ApplicationRecord
	has_many :incomes
	accepts_nested_attributes_for :incomes, :reject_if => lambda { |a| a[:fee_extracted] == 'false' }

	validates :begin_date, :end_date, :part_amount1, :percent1, presence: true

	def self.new_blank()
    fee = Fee.new()
    fee.begin_date ||= Date.today.prev_month.beginning_of_month
    fee.end_date ||= Date.today.prev_month.end_of_month
    fee
  end

end
