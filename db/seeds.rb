# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rails db:seed command (or created
# alongside the database with db:setup).
require 'csv'

CSV.foreach('db/seed_data/nurseries.csv', headers: true) do |row|
  Nursery.create(row.to_hash)
end

user = User.create(email: 'info@kitahub.de', password: 'secretfoo')
parents = Parents.create(user: user)
first_child = Child.create(
  first_name: 'Max',
  last_name: 'Mustermann',
  parents: parents
)
second_child = Child.create(
  first_name: 'Melanie',
  last_name: 'Mustermann',
  parents: parents
)
Nursery.first.first_request([first_child, second_child])

admin = User.create(email: 'admin@kitahub.de', password: 'secretfoo')
Admin.create(first_name: 'Foo', last_name: 'Bar', user: admin)
