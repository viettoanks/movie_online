class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :list_movie

  def list_movie
    @movies_list = Movie.where(movie_type: params[:movie_type])
                        .page(params[:page])
                        .per Settings.movies_controller.per_page
  end

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end
end
