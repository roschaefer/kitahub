# The homepage of kitahub.de. It shows something different for logged in users.
class WelcomeController < ApplicationController
  skip_before_action :require_login
  skip_before_action :require_admin

  def index
    redirect_to root_path unless request.path == root_path

    return unless logged_in?
    @children = current_parents.children
    render :status
  end
end
