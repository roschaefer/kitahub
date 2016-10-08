# Root class of all controllers.
# Adds session handling and www.kitahub.de support. It also takes care of non
# live features.
class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :not_live?
  protect_from_forgery with: :exception
  before_action :redirect_subdomain

  def not_live?
    @not_live ||= !Rails.env.production? || ENV['STAGING']
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_user
    redirect_to '/login' unless current_user
  end

  def redirect_subdomain
    app_domain = 'https://kitahub.de'
    redirect_to app_domain + request.fullpath if disabled?(request.host)
  end

  private

  def disabled?(host)
    host == 'www.kitahub.de'
  end
end
