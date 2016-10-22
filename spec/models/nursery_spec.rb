require 'rails_helper'

RSpec.describe Nursery, type: :model do
  it 'should have an address with a zip code' do
    address = Address.new('Park Avenue 4 A', 'foo', 'bar')
    address.valid?
    nursery = Nursery.create(
      name: 'foo',
      address: address,
      phone: '875958',
      mail: 'foo@bar.com'
    )

    expect(nursery.valid?).to eq false
  end

  it 'should have a name' do
    address = Address.new('Park Avenue 4 A', 'foo', 'bar')
    nursery = Nursery.create(
      name: nil,
      address: address,
      phone: '875958',
      mail: 'foo@bar.com'
    )

    expect(nursery.valid?).to eq false
    expect(nursery.errors[:name]).to eq ['can\'t be blank']
  end

  it 'should have a phone number' do
    address = Address.new('Park Avenue 4 A', '12345', '')
    nursery = Nursery.create(
      name: 'foo',
      address: address,
      phone: nil,
      mail: 'foo@bar.com'
    )

    expect(nursery.valid?).to eq false
    expect(nursery.errors[:phone]).to eq ['can\'t be blank']
  end

  it 'should have a mail address' do
    address = Address.new('Park Avenue 4 A', '12345', '')
    nursery = Nursery.create(
      name: 'foo',
      address: address,
      phone: '875958',
      mail: nil
    )

    expect(nursery.valid?).to eq false
    expect(nursery.errors[:mail]).to eq ['can\'t be blank']
  end

  it 'should have a default url name' do
    address = Address.new('Park Avenue 4 A', '12345', '')
    nursery = Nursery.create(
      name: 'Foo Bar',
      address: address,
      phone: '875958',
      mail: 'foo@bar.com'
    )

    expect(nursery.url_name).to eq 'foo-bar'
  end

  it 'should have a unique url name' do
    address = Address.new('Park Avenue 4 A', '12345', '')
    Nursery.create(
      name: 'Foo',
      address: address,
      phone: '875958',
      mail: 'foo@bar.com',
      url_name: 'foo'
    )
    nursery = Nursery.create(
      name: 'Foo',
      address: address,
      phone: '875958',
      mail: 'foo@bar.com',
      url_name: 'foo'
    )

    expect(nursery.valid?).to eq false
  end
end
