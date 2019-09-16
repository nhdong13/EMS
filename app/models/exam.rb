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

  def average_time
    total_time = 0;
    trainee_answer_sheets.each do |as|
      total_time += as.finish_time.to_i - as.start_time.to_i
      # break
    end
    total_time/trainee_answer_sheets.count
  end
end
