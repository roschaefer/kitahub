# frozen_string_literal: true
# URL name is a string that is derived from the nursery's name and used instead
# of IDs in URLs.
class AddUrlNameToNursery < ActiveRecord::Migration[5.0]
  def change
    add_column :nurseries, :url_name, :string
    add_index :nurseries, :url_name
  end
end
