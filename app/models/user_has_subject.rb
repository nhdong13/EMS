class UserHasSubject < ApplicationRecord
  belongs_to :user#, foreign_key: :supervisor_id
  belongs_to :subject#, foreign_key: :subject_id
end
