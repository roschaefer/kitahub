# frozen_string_literal: true
# Create the registrations table again in a cleaned way.
class CreateRegistrations < ActiveRecord::Migration[5.0]
  def change
    create_table :registrations, id: :uuid, &:timestamps
  end
end
