class Question < ApplicationRecord
  belongs_to :user, foreign_key: :create_by
  belongs_to :subject, foreign_key: :subject_id
  has_many :exam_has_questions, dependent: :destroy

  enum type: { multiple: 0, single: 1 }

end
