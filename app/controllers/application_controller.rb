class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :init_ransack

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end

  def init_ransack
    @init_ransack ||= Movie.ransack params[:q]
  end
end
