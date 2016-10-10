# The homepage of kitahub.de. It shows something different for logged in users.
class WelcomeController < ApplicationController
  def index
    redirect_to root_path unless request.path == root_path
    render :status if current_user
  end
end
