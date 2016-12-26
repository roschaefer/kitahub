# An aggregate root representing the registration process of parents at a
# nursery.
class Registration < ApplicationRecord
  belongs_to :nursery
  has_many :candidates
  has_many :children, through: :candidates

  accepts_nested_attributes_for :children
end
