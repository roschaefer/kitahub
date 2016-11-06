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

  it 'should start a registration' do
    address = Address.new('Park Avenue 4 A', '12345', '')
    nursery = Nursery.create(
      name: 'Foo',
      address: address,
      phone: '875958',
      mail: 'foo@bar.com',
      url_name: 'foo'
    )
    child = Child.create(
      first_name: 'foo',
      last_name: 'bar',
      parents: Parents.create
    )
    registration = nursery.first_request([child]).first
    mail = ActionMailer::Base.deliveries.last

    expect(registration.nursery).to eq nursery
    expect(registration.child).to eq child

    expect(mail.to).to eq ['foo@bar.com']
    expect(mail.subject).to eq 'Family would like to register'
  end

  it 'should start a registration only when all children have same parents' do
    address = Address.new('Park Avenue 4 A', '12345', '')
    nursery = Nursery.create(
      name: 'Foo',
      address: address,
      phone: '875958',
      mail: 'foo@bar.com',
      url_name: 'foo'
    )
    first_child = Child.create(
      first_name: 'foo',
      last_name: 'bar',
      parents: Parents.create
    )
    second_child = Child.create(
      first_name: 'foo',
      last_name: 'bar',
      parents: Parents.create
    )

    expect { nursery.first_request([first_child, second_child]) }.to raise_error
  end

  it 'should provide education concept as html' do
    address = Address.new('Park Avenue 4 A', '12345', '')
    nursery = Nursery.create(
      name: 'Foo',
      address: address,
      phone: '875958',
      mail: 'foo@bar.com',
      url_name: 'foo',
      education_concept: '* bilingual (deutsch-englisch)'
    )

    expect(nursery.education_concept_as_html)
      .to eq "<ul>\n<li>bilingual (deutsch-englisch)</li>\n</ul>\n"
  end

  it 'should escape html from education concept' do
    address = Address.new('Park Avenue 4 A', '12345', '')
    nursery = Nursery.create(
      name: 'Foo',
      address: address,
      phone: '875958',
      mail: 'foo@bar.com',
      url_name: 'foo',
      education_concept: 'bilingual (deutsch-englisch)<br>'
    )

    expect(nursery.education_concept_as_html)
      .to eq "<p>bilingual (deutsch-englisch)&lt;br&gt;</p>\n"
  end
end
