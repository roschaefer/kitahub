# Add registration table for registration processes to the database.
class CreateRegistrations < ActiveRecord::Migration[5.0]
  def change
    create_table :registrations do |t|
      t.belongs_to :parents, index: true, null: false
      t.belongs_to :nursery, index: true, null: false

      t.timestamps
    end
  end
end
