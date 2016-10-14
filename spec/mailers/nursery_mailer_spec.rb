require 'rails_helper'

RSpec.describe NurseryMailer, type: :mailer do
  describe 'nursery selected' do
    let(:mail) do
      nursery = Nursery.create(
        name: 'Clara Zetkin Kita Potsdam',
        mail: 'info@kitahub.de',
        phone: '088665',
        address: Address.new('Hebbelstr.', '12345', 'Berlin')
      )
      parents = Parents.create
      NurseryMailer.nursery_selected(nursery, parents)
    end

    it 'renders the headers' do
      expect(mail.to).to eq(['info@kitahub.de'])
      expect(mail.from).to eq(['info@kitahub.de'])
    end

    it 'renders the body' do
      expect(mail.body.encoded)
        .to match('A new family wants to start registrering in your nursery.')
    end
  end
end
