# Parents must also have a name.
class AddNameToParents < ActiveRecord::Migration[5.0]
  def change
    add_column :parents, :first_name, :string
    add_column :parents, :last_name, :string
  end
end
