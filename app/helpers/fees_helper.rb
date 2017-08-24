module FeesHelper
	def income_id_checkbox(i, income_id, fee_incomes)
		checked_flag = fee_incomes.map{|income| income.id}.include?(income_id) ? "checked='checked'" : ""
		return "<input class='fee_incomes_id' name='fee[incomes_attributes][#{i}][id]' type='checkbox' value='#{income_id}' #{checked_flag} />".html_safe
	end		

	def income_fee_amount_input(i, income)
		return "<input class='fee_incomes_fee_amount numeric decimal optional' name='fee[incomes_attributes][#{i}][fee_amount]' type='number' value='#{income.fee_amount}'/>".html_safe
	end	
end
