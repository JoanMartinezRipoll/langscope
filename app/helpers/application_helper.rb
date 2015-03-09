module ApplicationHelper
  def link_to_add_fields(name, f, association)
    #Builds a new object of type f. For the school case, f.object will return school. Then
    #send(association) will send the method language_offers to the school object, so school.language_offers
    #finally this will create anew language offer instance
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    #this would be fileds_for( :language_offers) only for the object new object
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end
end
