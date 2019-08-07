class ExamHasQuestion < ApplicationRecord
  belongs_to :exam, foreign_key: :exam_id
  belongs_to :question, foreign_key: :question_id
end
