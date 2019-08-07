class Subject < ApplicationRecord
  belongs_to :user, foreign_key: :create_by
  has_many :user_has_subjects, dependent: destroy
  has_many :exams, dependent: destroy
  has_many :questions, dependent: destroy
end
