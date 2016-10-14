# Preview all emails at http://localhost:3000/rails/mailers/nursery_mailer
class NurseryMailerPreview < ActionMailer::Preview
  def nursery_selected
    nursery = Nursery.create(
      name: 'Clara Zetkin Kita Potsdam',
      mail: 'info@kitahub.de',
      phone: '088665',
      address: Address.new('Hebbelstr.', '12345', 'Berlin')
    )
    parents = Parents.create
    NurseryMailer.nursery_selected(nursery, parents)
  end
end
