class Address
  attr_reader :street, :zip, :city
  def initialize(street, zip, city)
    @street, @zip, @city = street, zip, city
  end
  def full
    "#{street} #{zip} #{city}"
  end
end
