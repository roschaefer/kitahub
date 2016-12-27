# frozen_string_literal: true
# This child needs to be registered in a nursery
class Child < ApplicationRecord
  belongs_to :parents
  has_many :registrations

  validates :first_name, presence: { message: 'darf nicht fehlen' }
  validates :last_name, presence: { message: 'darf nicht fehlen' }

  # validates_format_of :birth_date, :with => /\d{2}\/\d{2}\/\d{4}/,
  # message: 'Das Datum muss wie folgt eingetragen werden: tt/mm/jjjj'
  # validates :birth_date, presence: true, message: 'Das Datum fehlt!'

  def self.same_parents?(children)
    parents = children.map(&:parents).uniq
    parents.size < 2
  end
end
