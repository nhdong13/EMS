class User < ApplicationRecord
  validates :fullname, presence: true, length: { maximum: Settings.user.name.maximum_length }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: Settings.user.email.maximum_length },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :address, presence: true, length: { maximum: Settings.user.address.maximum_length }
  validates :password, presence: true, length: { minimum: Settings.user.password.minimum_length }, allow_nil: true

  # supervisor has_many created_subjects
  has_many :created_subjects, class_name: Subject.name, foreign_key: :create_by
  # trainee has_many joined_subjects
  has_many :user_has_subjects
  has_many :joined_subjects, through: :user_has_subjects, class_name: Subject.name, source: :subject
  
  # supervisor has_many created_exams
  has_many :created_exams, class_name: Exam.name, foreign_key: :create_by
  has_many :can_join_exams, class_name: Exam.name, through: :joined_subjects, source: :exams

  has_many :trainee_answer_sheets, foreign_key: :trainee_id
  has_many :questions, foreign_key: :create_by
  
  scope :ordered_user_by_name, -> { order :fullname }
  enum role: {trainee: 0, admin: 1, supervisor: 2 }

  has_secure_password
end
