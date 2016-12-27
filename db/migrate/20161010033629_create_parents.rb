# frozen_string_literal: true
# Add table parents for representing the parents in a registration process.
class CreateParents < ActiveRecord::Migration[5.0]
  def change
    create_table :parents, id: :uuid, &:timestamps
  end
end
