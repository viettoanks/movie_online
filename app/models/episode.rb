class Episode < ApplicationRecord
  belongs_to :movie

  validates :movie, :link, presence: true
end
