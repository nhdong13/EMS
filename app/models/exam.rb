class Exam < ApplicationRecord
  has_many :trainee_answer_sheets, dependent: :destroy
  has_many :exam_has_questions, dependent: :destroy
  belongs_to :user, foreign_key: :create_by
  belongs_to :subject, foreign_key: :subject_id
end
