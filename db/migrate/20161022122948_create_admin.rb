# Creates the admin user table. The records in the table will be added directly
# in the database at the beginning. Thus the null constraints are required.
# Once an user interface to add those users exsists, the app can do the
# presence validation.
class CreateAdmin < ActiveRecord::Migration[5.0]
  def change
    create_table :admins, id: :uuid do |t|
      t.references :user, type: :uuid, foreign_key: true
      t.string :first_name, null: false
      t.string :last_name, null: false
    end
  end
end
