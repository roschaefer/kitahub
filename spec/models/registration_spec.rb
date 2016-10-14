require 'rails_helper'

RSpec.describe Registration, type: :model do
  it 'should have parents' do
    reg = Registration.create
    expect(reg.valid?).to eq false
    expect(reg.errors[:parents]).to eq ['must exist']
  end

  it 'should have a nursery' do
    reg = Registration.create
    expect(reg.valid?).to eq false
    expect(reg.errors[:nursery]).to eq ['must exist']
  end

  it 'should be valid with nursery and parents' do
    address = Address.new('Park Avenue 4 A', '12345', 'Berlin')
    nursery = Nursery.create(
      name: 'foo',
      address: address,
      phone: '875958',
      mail: 'foo@example.com'
    )
    parents = Parents.create
    reg = Registration.create(parents: parents, nursery: nursery)
    expect(reg.valid?).to eq true
  end
end
