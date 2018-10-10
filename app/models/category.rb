class Category < ApplicationRecord
  has_many :categories_movies
  has_many :movies, through: :categories_movies

  validates :title, presence: true,
    length: {maximum: Settings.category.title.max_length}
end
