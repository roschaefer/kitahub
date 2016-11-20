# Validates uniqueness of registration per child and nursery.
class UniqueRegValidator < ActiveModel::Validator
  def validate(reg)
    return unless reg.exists?

    reg.errors[:child] <<
      'has already been registered at this nursery'
  end
end

# An aggregate root representing the registration process of parents at a
# nursery.
class Registration < ApplicationRecord
  belongs_to :nursery
  belongs_to :child

  validates_with UniqueRegValidator

  delegate :parents, to: :child

  def exists?
    Registration.where(nursery: nursery, child: child).any?
  end
end
