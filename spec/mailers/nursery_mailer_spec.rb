require 'rails_helper'

RSpec.describe NurseryMailer, type: :mailer do
  describe 'first request' do
    let(:mail) do
      nursery = Nursery.create(
        name: 'Clara Zetkin Kita Potsdam',
        mail: 'info@kitahub.de',
        phone: '088665',
        address: Address.new('Hebbelstr.', '12345', 'Berlin')
      )
      child = Child.create(
        first_name: 'foo',
        last_name: 'bar',
        parents: Parents.create
      )
      registration = Registration.create(nursery: nursery, child: child)
      NurseryMailer.first_request(registration)
    end

    it 'renders the headers' do
      expect(mail.to).to eq(['info@kitahub.de'])
      expect(mail.from).to eq(['info@kitahub.de'])
    end

    it 'renders the body' do
      expect(mail.body.encoded)
        .to include('Familie @parents.name')
    end
  end
end
