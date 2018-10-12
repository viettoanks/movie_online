class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable, :confirmable
  has_many :movies_users, dependent: :destroy
  has_many :bookmark_movies, through: :movies_users, source: :movie
  enum role: {user: 0, sub: 1, admin: 2}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
    length: {maximum: Settings.user.email.max_length},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: Settings.user.email.case_sensitive}
  VALID_PHONE_REGEX = /\A^(03|09)[0-9]{8}$\z/
  validates :phone, length: {maximum: Settings.user.phone.max_length},
    format: {with: VALID_PHONE_REGEX}
end
