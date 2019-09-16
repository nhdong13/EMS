class Exam < ApplicationRecord
  has_many :trainee_answer_sheets, dependent: :destroy
  has_many :exam_has_questions, dependent: :destroy
  has_many :questions, through: :exam_has_questions
  belongs_to :user, foreign_key: :create_by
  belongs_to :subject

  enum status: { enable: 0, disable: 1 }
  scope :ordered, -> { order :name }

  def questions_counter
    questions.count
  end
end
