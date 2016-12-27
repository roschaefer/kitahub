# frozen_string_literal: true
# Create a reference to children
class AddChildToRegistration < ActiveRecord::Migration[5.0]
  def change
    add_reference :registrations, :child, type: :uuid, foreign_key: true
  end
end
