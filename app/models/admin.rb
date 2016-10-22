# Represents an admin user on the kitahub platform. Admin users are allowed to
# additional stuff, that others are not allowed.
class Admin < ApplicationRecord
  belongs_to :user
end
