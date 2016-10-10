require 'rails_helper'

RSpec.describe Address, type: :model do
  it 'should have a street' do
    address = Address.new(nil, '12345', 'Berlin')
    expect(address.valid?).to eq false
    expect(address.errors[:street]).to eq ['can\'t be blank']
  end

  it 'should have a numerical ZIP code' do
    address = Address.new('Park Avenue 4 A', '1234f', 'Berlin')
    expect(address.valid?).to eq false
    expect(address.errors[:zip]).to eq ['is not a number']
  end

  it 'should have a ZIP code of length 5' do
    address = Address.new('Park Avenue 4 A', '1', 'Berlin')
    expect(address.valid?).to eq false
    expect(address.errors[:zip])
      .to eq ['is the wrong length (should be 5 characters)']
  end
end
