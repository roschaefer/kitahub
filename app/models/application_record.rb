# frozen_string_literal: true
# Root class of all model classes. It enables active record on the models.
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
