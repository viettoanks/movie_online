class MoviesController < ApplicationController
  before_action :find_movie, :find_relate_movies, :find_current_episode,
    :find_movie_episodes, only: :show

  def index
    if params[:q]
      @movies_list = @init_ransack.result.page(params[:page])
                                  .per Settings.movies_controller.per_page
    else
      @movies_list = Movie.where(movie_type: params[:movie_type])
                          .page(params[:page])
                          .per(18)
    end
  end

  def show; end

  private

  def find_movie
    @movie = Movie.find_by id: [params[:movie_id], params[:id]]
    return if @movie
    flash[:danger] = t ".movie_not_found"
    redirect_to root_url
  end

  def find_relate_movies
    @relate_movies = Movie.joins(:categories)
                          .merge(Category.where(id: @movie.categories.ids))
                          .where.not(id: @movie)
                          .sample Settings.movie.relate_movies_quantity
  end

  def find_current_episode
    @current_episode = if params[:order].to_i.positive?
                         @movie.episodes.find_by order: params[:order]
                       else
                         @movie.episodes.first
                       end
  end

  def find_movie_episodes
    return if @movie.episodes_size == 0
    @episodes = @movie.episodes.order_asc
  end
end
