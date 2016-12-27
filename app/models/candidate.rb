# frozen_string_literal: true
# Represents a child, that registers at a nursery.
class Candidate < ApplicationRecord
  belongs_to :child
  belongs_to :registration
end
