# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rails db:seed command (or created
# alongside the database with db:setup).
require 'csv'

CSV.foreach('db/seed_data/nurseries.csv', headers: true) do |row|
  Nursery.create(row.to_hash)
end

CSV.foreach('db/seed_data/parents.csv', headers: true) do |row|
  Parents.create(row.to_hash)
end
