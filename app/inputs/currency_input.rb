class CurrencyInput < SimpleForm::Inputs::Base
  def input(wrapper_options)
    merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)
    num_field = "#{@builder.number_field(attribute_name, merged_input_options)}"
    ('<div class="input-group"><div class="input-group-addon">￥</div>%s</div>' % [num_field]).html_safe
  end
end
