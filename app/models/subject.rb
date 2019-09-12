class Subject < ApplicationRecord
  #belongs_to :user, foreign_key: :create_by
  has_many :user_has_subjects, foreign_key: :subject_id
  has_many :users, through: :user_has_subjects
  has_many :exams#, dependent: destroy
  has_many :questions#, dependent: destroy
  belongs_to :user, foreign_key: :create_by

  scope :ordered_subjects_by_name,-> { order(name: :asc) }
end
