class WelcomeController < ApplicationController
  def index
    redirect_to root_path unless request.path == root_path

    if current_user
      render :status
    end
  end
end
