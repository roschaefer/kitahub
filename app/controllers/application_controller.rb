# frozen_string_literal: true
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
  before_action :require_login
  before_action :require_admin

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
    app_domain = 'https://www.kitahub.de'
    redirect_to app_domain + request.fullpath if disabled?(request.host)
  end

  def init_current_user
    if session[:user_id]
      user = User.find(session[:user_id])
      session[:user_id] = nil unless user
    end

    @current_parents ||= Parents.find_by user: user if user
    @current_admin ||= Admin.find_by user: user if user && !logged_in?
  end

  def require_login
    redirect_to login_path unless logged_in?
  end

  def require_admin
    redirect_to root_path unless admin?
  end

  private

  def disabled?(host)
    host == 'kitahub.de'
  end
end
