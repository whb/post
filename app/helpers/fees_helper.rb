module FeesHelper
	def income_id_checkbox(i, income_id, fee_incomes)
		checked_flag = fee_incomes.map{|income| income.id}.include?(income_id) ? "checked='checked'" : ""
		return "<input class='fee_incomes_id' name='fee[incomes_attributes][#{i}][id]' type='checkbox' value='#{income_id}' #{checked_flag} />".html_safe
	end		

	def income_fee_amount_input(i, income)
		return "<input class='fee_incomes_fee_amount numeric decimal optional' name='fee[incomes_attributes][#{i}][fee_amount]' type='number' value='#{income.fee_amount}'/>".html_safe
	end	

	def fee_detail_checkbox(fee_details, income_id)
		checked_flag = fee_details.map{|detail| detail.income_id}.include?(income_id) ? "checked='checked'" : ""
		return "<input type='checkbox' name='add_fee_detail' value='#{income_id}' #{checked_flag}>".html_safe
	end

	def fee_detail_inputs(i, fee_details, income_id)
		detail = fee_details.detect{|detail| detail.income_id == income_id}
		return "" unless detail
		inputs = "￥<input type='hidden' value='#{detail.id}' name='fee[fee_details_attributes][#{i}][id]' id='fee_fee_details_attributes_#{i}_id'>" +
    "<input type='hidden' value='#{detail.income_id}' name='fee[fee_details_attributes][#{i}][income_id]' id='fee_fee_details_attributes_#{i}_income_id'>" +
    "<input type='number' value='#{detail.fee_amount}' name='fee[fee_details_attributes][#{i}][fee_amount]' id='fee_fee_details_attributes_#{i}_fee_amount'>"
		return inputs.html_safe
	end

end
