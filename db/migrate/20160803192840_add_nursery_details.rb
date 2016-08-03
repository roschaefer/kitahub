class AddNurseryDetails < ActiveRecord::Migration[5.0]
  def change
    add_column :nurseries, :name, :string, :null => false
    add_column :nurseries, :address_street, :string, :null => false
    add_column :nurseries, :address_zip, :integer, :null => false
    add_column :nurseries, :address_city, :string, :null => false
    add_column :nurseries, :phone, :string, :null => false
    add_column :nurseries, :mail, :string, :null => false
    add_column :nurseries, :children_age, :string
    add_column :nurseries, :care_time, :string
    add_column :nurseries, :education_concept, :string
    add_column :nurseries, :management, :string
    add_column :nurseries, :capacity, :string
    add_column :nurseries, :district, :string
  end
end
