# An aggregate root representing the registration process of parents at a
# nursery.
class Registration < ApplicationRecord
  belongs_to :parents
  belongs_to :nursery
end
