module ApplicationHelper
  def show_errors(object, field_name)
    object.errors.full_messages_for(field_name).join("\n")
  end 

  def question_attr answer, answer_key
    attr = "disabled"
    count = 0
    answer.select{|item| count += 1 if item == answer_key}
    attr += " checked" if count > 0
    attr
  end
end
