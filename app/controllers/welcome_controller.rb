# frozen_string_literal: true
# The homepage of kitahub.de. It shows something different for logged in users.
class WelcomeController < ApplicationController
  skip_before_action :require_login
  skip_before_action :require_admin

  def index
    redirect_to root_path unless request.path == root_path

    return unless logged_in?

    children = current_parents.children unless admin?
    @registrations = registrations_for children if children
    render :status
  end

  private

  def registrations_for(children)
    Registration.joins(
      candidates: :child
    ).where(
      children: { id: children.map(&:id) }
    ).distinct
  end
end
