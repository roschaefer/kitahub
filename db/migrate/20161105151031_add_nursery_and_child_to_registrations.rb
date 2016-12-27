# frozen_string_literal: true
# Adds foreign keys to the nursery and child. Each registration belongs to them.
class AddNurseryAndChildToRegistrations < ActiveRecord::Migration[5.0]
  def change
    add_reference :registrations, :child, type: :uuid, foreign_key: true
    add_reference :registrations, :nursery, type: :uuid, foreign_key: true
  end
end
