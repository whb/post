class PercentInput < SimpleForm::Inputs::Base
  def input(wrapper_options)
    merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)
    text_field = "#{@builder.text_field(attribute_name, merged_input_options)}"
    ("<div class='input-group'>%s<div class='input-group-addon'>%s</div></div>" % [text_field, "%"]).html_safe
  end
end
