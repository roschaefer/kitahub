# Ensures, that parents belong to a user account to login to the app.
class AddUserToParents < ActiveRecord::Migration[5.0]
  def change
    add_reference :parents, :user, foreign_key: true
  end
end
