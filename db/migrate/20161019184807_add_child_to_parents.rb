class AddChildToParents < ActiveRecord::Migration[5.0]
  def change
    add_reference :children, :parents, foreign_key: true
  end
end
