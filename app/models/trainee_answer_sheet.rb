class TraineeAnswerSheet < ApplicationRecord
  belongs_to :user, foreign_key: :trainee_id
  belongs_to :exam
end
