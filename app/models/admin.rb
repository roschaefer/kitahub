# frozen_string_literal: true
# Represents an admin user on the kitahub platform. Admin users are allowed to
# additional stuff, that others are not allowed.
class Admin < ApplicationRecord
  belongs_to :user

  def display_name
    "#{first_name} #{last_name} (Admin)"
  end
end
