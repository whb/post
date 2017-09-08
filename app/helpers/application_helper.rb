module ApplicationHelper
	def link_to_add_fields(f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.simple_fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to('#', class: "add_fields btn btn-info btn-sm", data: {id: id, fields: fields.gsub("\n", "")}) do
    	yield 
    end
  end
end


