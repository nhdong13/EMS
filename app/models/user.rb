class User < ApplicationRecord
  # has_and_belongs_to_many :subjects#, through: :user_has_subject #, dependent: destroy
  # has_many :subjects, through: :user_has_subject
  has_many :active_subjects, class_name: UserHasSubject.name,
                             foreign_key: :user_id, 
                             dependent: :destroy
  has_many :exams#, dependent: destroy
  has_many :trainee_answer_sheets#, dependent: destroy
  has_many :questions
  # has_many :users
  # belongs_to :user, foreign_key: :create_by
  enum role: [:trainee, :admin, :supervisor] 

  # scope :trainees,-> {where role: User.roles[:trainee]}

  has_secure_password
end
