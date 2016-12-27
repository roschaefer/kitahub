# frozen_string_literal: true
# The preferred start date fits much better to the registration.
class MovePreferredStartDateFromChildToRegistration <
      ActiveRecord::Migration[5.0]
  def change
    remove_column :children, :prefered_start_date, :date
    add_column :registrations, :preferred_start_date, :date
  end
end
