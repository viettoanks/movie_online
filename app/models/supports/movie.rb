class Supports::Movie
  attr_reader :movie

  def initialize movie
    @movie ||= movie
  end

  def features
    @features ||= Movie.load_by_type(:features)
                       .limit(Settings.movies_controller.number_movie)
  end

  def series
    @series ||= Movie.load_by_type(:series)
                     .limit(Settings.movies_controller.number_movie)
  end

  def hots
    @hots ||= Movie.load_by_type(:hots)
                   .limit(Settings.movies_controller.number_movie)
  end
end
