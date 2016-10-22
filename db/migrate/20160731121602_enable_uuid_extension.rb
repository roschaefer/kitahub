# Add UUID support to PostgreSQL. This enables the usage of UUIDs as primary
# keys.
class EnableUuidExtension < ActiveRecord::Migration[5.0]
  def change
    enable_extension 'uuid-ossp'
  end
end
