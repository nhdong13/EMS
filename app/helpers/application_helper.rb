module ApplicationHelper
  def show_errors(object, field_name)
    object.errors.full_messages_for(field_name).join("\n")
  end 
end
