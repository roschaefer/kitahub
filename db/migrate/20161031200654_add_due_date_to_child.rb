class AddDueDateToChild < ActiveRecord::Migration[5.0]
  def change
    add_column :children, :due_date, :date
  end
end
