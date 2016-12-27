# frozen_string_literal: true
# The fields are not required on the user level. They will be added somewhere
# else.
class RemoveFirstNameAndLastNameFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :first_name, :string
    remove_column :users, :last_name, :string
  end
end
