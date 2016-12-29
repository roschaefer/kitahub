# frozen_string_literal: true
# An entity representing the parents in the registration process.
class Parents < ApplicationRecord
  belongs_to :user
  has_many :children

  accepts_nested_attributes_for :user

  delegate :email, to: :user

  def display_name
    "#{first_name} #{last_name}"
  end

  validates :user, uniqueness: true
end
