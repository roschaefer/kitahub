# Root class of all controllers.
# Adds session handling and www.kitahub.de support. It also takes care of non
# live features.
class ApplicationController < ActionController::Base
  helper_method :admin?
  helper_method :logged_in?
  helper_method :not_live?
  helper_method :current_user_display_name
  helper_method :current_parents
  protect_from_forgery with: :exception
  before_action :redirect_subdomain
  before_action :init_current_user

  attr_reader :current_parents

  def not_live?
    @not_live ||= !Rails.env.production? || ENV['STAGING']
  end

  def logged_in?
    !@current_parents.nil? || admin?
  end

  def admin?
    !@current_admin.nil?
  end

  def current_user_display_name
    if admin?
      @current_admin.display_name
    elsif @current_parents
      @current_parents.display_name
    end
  end

  def redirect_subdomain
    app_domain = 'https://kitahub.de'
    redirect_to app_domain + request.fullpath if disabled?(request.host)
  end

  def init_current_user
    user = User.find(session[:user_id]) if session[:user_id]

    @current_parents ||= Parents.where(user: user).first if user
    @current_admin ||= Admin.where(user: user).first if user && !logged_in?
  end

  private

  def disabled?(host)
    host == 'www.kitahub.de'
  end
end
