# frozen_string_literal: true
# Provides static pages and ensures they are accessible.
class StaticpagesController < ApplicationController
  skip_before_action :require_login
  skip_before_action :require_admin
end
