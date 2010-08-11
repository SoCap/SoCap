module ApplicationHelper
  
  def link_to_remove_fields(name, f)  
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")  
  end
   
  def link_to_add_fields(name, f, association)  
    new_object = f.object.class.reflect_on_association(association).klass.new  
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|  
      render(association.to_s.singularize + "_fields", :f => builder)  
    end  
    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")  
  end
  
  def weight_select(weight)
    cnt = 1
    html = ""
    5.times do
      weight == cnt ? html << "<option selected='true'>#{cnt}</option>" : html << "<option>#{cnt}</option>"
      cnt += 1
    end
    p "################################################"
    p html
    return html
  end

  def current_user
    if !current_attendee.blank?
      return current_attendee
    elsif !current_organizer.blank?
      return current_organizer
    else
      return nil
    end
  end
  
  def current_user_class
    user = current_user
    user != nil ? user.class : nil
  end
  
end
