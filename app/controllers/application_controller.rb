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
    if request.host == 'www.kitahub.de'
      redirect_to 'https://kitahub.de' + request.fullpath
    end
  end
end
