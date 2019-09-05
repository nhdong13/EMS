class User < ApplicationRecord
  validates :fullname, presence: true, length: { maximum: Settings.user.name.maximum_length }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: Settings.user.email.maximum_length },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :address, presence: true, length: { maximum: Settings.user.address.maximum_length }
  validates :password, presence: true, length: { minimum: Settings.user.password.minimum_length }, allow_nil: true

  # has_and_belongs_to_many :subjects#, through: :user_has_subject #, dependent: destroy
  # has_many :subjects, through: :user_has_subject
  has_many :active_subjects, class_name: UserHasSubject.name,
                             foreign_key: :user_id, 
                             dependent: :destroy
  has_many :exams#, dependent: destroy
  has_many :trainee_answer_sheets, foreign_key: :trainee_id #, dependent: destroy
  has_many :questions
  # has_many :users
  # belongs_to :user, foreign_key: :create_by
  enum role: [:trainee, :admin, :supervisor] 

  # scope :trainees,-> {where role: User.roles[:trainee]}

  has_secure_password
end
