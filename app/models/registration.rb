# An aggregate root representing the registration process of parents at a
# nursery.
class Registration < ApplicationRecord
  belongs_to :nursery
  belongs_to :child

  delegate :parents, to: :child
end
