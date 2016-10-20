class AddChildToRegistration < ActiveRecord::Migration[5.0]
  def change
    add_reference :registrations, :children, foreign_key: true
  end
end
