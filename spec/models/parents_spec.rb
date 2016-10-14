require 'rails_helper'

RSpec.describe Parents, type: :model do
  it 'should have a registration after selecting a nursery' do
    address = Address.new('Park Avenue 4 A', '12345', 'Berlin')
    nursery = Nursery.create(
      name: 'foo',
      address: address,
      phone: '875958',
      mail: 'foo@bar.org'
    )
    parents = Parents.create
    parents.select_nursery(nursery)
    expect(parents.registrations.count).to eq 1
  end
end
