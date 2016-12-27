# frozen_string_literal: true
# Some columns have been setup incorrectly. This migration cleans it up.
class CleanUpNurseryTable < ActiveRecord::Migration[5.0]
  def change
    change_column :nurseries, :name, :string, null: true
    change_column :nurseries, :address_street, :string, null: true
    change_column :nurseries, :address_zip, :string, null: true
    change_column :nurseries, :address_city, :string, null: true
    change_column :nurseries, :phone, :string, null: true
    change_column :nurseries, :mail, :string, null: true
  end
end
