class TraineeAnswerSheet < ApplicationRecord
  belongs_to :user, foreign_key: :trainee_id
  belongs_to :exam, foreign_key: :exam_id
end
