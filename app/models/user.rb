class User < ApplicationRecord
  has_many :subjects, dependent: destroy
  has_many :user_has_subjects, dependent: destroy
  has_many :exams, dependent: destroy
  has_many :trainee_answer_sheets, dependent: destroy
  has_many :questions, dependent: destroy
  has_many :users
  belongs_to :user, foreign_key: :create_by
end
