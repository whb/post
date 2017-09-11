module IncomesHelper
	def fee_amount_input_group(income)
	 	no_fee = "<input class='form-control currency optional' type='text' value='no fee'>"
	 	no_fee_input = "<div class='input-group'><div class='input-group-addon'>￥</div><input class='form-control currency optional' type='number' value=''></div>"
	 	input = "<div class='input-group'><div class='input-group-addon'>￥</div><input class='form-control currency optional' type='number' value='#{income.fee_amount}'></div>"

		input_group = "<div class='form-group currency optional'>" +
		  "<label class='col-sm-3 control-label currency optional' for='income_abstract'>#{Income.human_attribute_name(:fee_amount)}</label>" +
		  "<div class='col-sm-9'>" +
		  	(income.feed? ? input : no_fee_input) +
		  "</div>" +
		"</div>"
		
		return input_group.html_safe
	end

  def income_status(income)
  	key = "income_status.#{income.status}" 
  	return "<span class='label label-info'>#{t key}</span>".html_safe
  end
end
