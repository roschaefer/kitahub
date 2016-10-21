# An entity representing the parents in the registration process.
class Parents < ApplicationRecord
  belongs_to :user
  has_many :registrations
  has_many :children

  def select_nursery(child, nursery)
    Registration.create(parents: self, child: child, nursery: nursery)
    NurseryMailer.nursery_selected(nursery, self).deliver_later
  end

  delegate :email, to: :user

  validates :user, uniqueness: true
end
