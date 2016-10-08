# Validation for email addresses
class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return false unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    record.errors[attribute] << (options[:message] || 'is not an email')
  end
end

# The user is an entity, that represents the logged in user.
class User < ApplicationRecord
  has_secure_password

  def full_name
    "#{first_name} #{last_name}"
  end

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true, email: true
  validates :password, length: { minimum: 8 }
end
