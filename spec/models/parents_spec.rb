require 'rails_helper'

RSpec.describe Parents, type: :model do
  it 'should have a unique user' do
    user = User.create(email: 'foo@bar.com', password: 'secretfoo')
    first_parents = Parents.create(user: user)
    second_parents = Parents.create(user: user)

    expect(first_parents.valid?).to eq true
    expect(second_parents.valid?).to eq false
  end

  it 'should have a registration after selecting a nursery' do
    address = Address.new('Park Avenue 4 A', '12345', 'Berlin')
    nursery = Nursery.create(
      name: 'foo',
      address: address,
      phone: '875958',
      mail: 'foo@bar.org'
    )
    user = User.create(email: 'foo@bar.com', password: 'secretfoo')
    parents = Parents.create(user: user)
    parents.select_nursery(nursery)
    expect(parents.registrations.count).to eq 1
  end
end
