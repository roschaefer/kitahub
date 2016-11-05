# An entity representing the parents in the registration process.
class Parents < ApplicationRecord
  belongs_to :user
  has_many :registrations
  has_many :children

  delegate :email, to: :user

  def display_name
    email
  end

  validates :user, uniqueness: true
end
