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
    child = Child.create(parents: parents)
    registration = parents.select_nursery(child, nursery)
    NurseryMailer.nursery_selected(registration)
  end
end
