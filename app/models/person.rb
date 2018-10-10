class Person < ApplicationRecord
  movies_people = MoviesPerson.arel_table
  has_many :movies_people
  has_many :movies, through: :movies_people
  has_many :cast_movies, ->{where(movies_people[:role].eq(false))},
    source: :movie, through: :movies_people
  has_many :direct_movies, ->{where(movies_people[:role].eq(true))},
    source: :movie, through: :movies_people

  validates :name, presence: true,
    length: {minimum: Settings.person.name.min_length,
             maximum: Settings.person.name.max_length}
end
