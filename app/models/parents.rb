# An entity representing the parents in the registration process.
class Parents < ApplicationRecord
  belongs_to :user
  has_many :registrations

  def select_nursery(nursery)
    Registration.create(parents: self, nursery: nursery)
    NurseryMailer.nursery_selected(nursery, self).deliver_later
  end
end
