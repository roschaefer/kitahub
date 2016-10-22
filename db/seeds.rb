# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rails db:seed command (or created
# alongside the database with db:setup).
require 'csv'

CSV.foreach('db/seed_data/nurseries.csv', headers: true) do |row|
  Nursery.create(row.to_hash)
end

user = User.create(email: 'info@kitahub.de', password: 'secretfoo')
Parents.create(user: user)

admin = User.create(email: 'admin@kitahub.de', password: 'secretfoo')
Admin.create(first_name: 'Foo', last_name: 'Bar', user: admin)
