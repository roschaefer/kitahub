# Add detail information about a nursery to the database.
class AddNurseryDetails < ActiveRecord::Migration[5.0]
  def add_address
    add_column :nurseries, :address_street, :string
    add_column :nurseries, :address_zip, :integer
    add_column :nurseries, :address_city, :string
  end

  def change
    add_column :nurseries, :name, :string
    add_address
    add_column :nurseries, :phone, :string
    add_column :nurseries, :mail, :string
    add_column :nurseries, :children_age, :string
    add_column :nurseries, :care_time, :string
    add_column :nurseries, :education_concept, :string
    add_column :nurseries, :management, :string
    add_column :nurseries, :capacity, :string
    add_column :nurseries, :district, :string
  end
end
