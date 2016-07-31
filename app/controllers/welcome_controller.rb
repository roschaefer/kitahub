class WelcomeController < ApplicationController
  def index
    if current_user
      render :status
    end
  end
end
