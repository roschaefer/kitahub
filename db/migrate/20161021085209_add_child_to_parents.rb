# create a reference to parents
class AddChildToParents < ActiveRecord::Migration[5.0]
  def change
    add_reference :children, :parents, type: :uuid, foreign_key: true
  end
end
