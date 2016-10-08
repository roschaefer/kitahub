# A value object, that represents the postal address of someone.
class Address
  attr_reader :street, :zip, :city
  def initialize(street, zip, city)
    @street = street
    @zip = zip
    @city = city
  end

  def full
    "#{street} #{zip} #{city}"
  end
end
