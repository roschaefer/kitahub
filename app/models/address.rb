# A value object, that represents the postal address of someone.
class Address
  include ActiveModel::Validations

  attr_reader :street, :zip, :city

  def validation_context=(value); end

  def initialize(street, zip, city)
    errors
    @street = street
    @zip = zip
    @city = city
  end

  def full
    "#{street}, #{zip} #{city}"
  end

  validates :street, presence: true, allow_blank: false
  validates :zip,
            presence: true,
            length: { is: 5 },
            numericality: { only_integer: true }
end
