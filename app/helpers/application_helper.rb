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

  def current_tab tab_name, params_tab
    if tab_name.nil? 
      "active" if params_tab == "about" 
    else
      "active" if tab_name == params_tab
    end
  end

  def current_tab_body tab_name, params_tab
    if tab_name.nil? 
      " in active" if params_tab == "about" 
    else
      " in active" if tab_name == params_tab
    end
  end

  def exam_questions(exam_id, question_id)
    exam_qs = ExamHasQuestion.where(exam_id: exam_id, question_id: question_id).first
    exam_qs.nil? ? 0 : exam_qs.mark
  end

  def load_shortcut
    @shortcuts = current_user.created_subjects.ordered_subjects_by_name
  end
end
