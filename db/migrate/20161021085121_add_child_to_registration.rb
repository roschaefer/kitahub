class AddChildToRegistration < ActiveRecord::Migration[5.0]
  def change
    add_reference :registrations, :child, foreign_key: true
  end
end
