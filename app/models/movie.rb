class Movie < ApplicationRecord
  movies_people = MoviesPerson.arel_table
  has_many :categories_movies, dependent: :destroy
  has_many :categories, through: :categories_movies
  has_many :movies_people, dependent: :destroy
  has_many :actors, ->{where(movies_people[:role].eq(false))},
    source: :person, through: :movies_people
  has_many :directors, ->{where(movies_people[:role].eq(true))},
    source: :person, through: :movies_people
  has_many :movies_users, dependent: :destroy
  has_many :bookmark_users, through: :movies_users, source: :user
  has_many :view_counts, dependent: :destroy
  has_many :episodes, dependent: :destroy

  validates :name, presence: true,
    length: {maximum: Settings.movie.name.max_length}
  validates :alternative_name,
    length: {maximum: Settings.movie.alternative_name.max_length}
  validates :poster, presence: true

  delegate :size, to: :episodes, prefix: true
  delegate :size, to: :actors, prefix: true
  delegate :size, to: :directors, prefix: true
end
