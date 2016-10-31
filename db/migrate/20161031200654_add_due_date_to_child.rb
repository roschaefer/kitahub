class AddDueDateToChild < ActiveRecord::Migration[5.0]
  def change
    add_column :children, :prefered_start_date, :date
  end
end
