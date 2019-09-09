class Exam < ApplicationRecord
  has_many :trainee_answer_sheets, dependent: :destroy
  has_many :exam_has_questions, dependent: :destroy
  has_many :questions, through: :exam_has_questions
  belongs_to :user
  belongs_to :subject
end
