# Sends mails to nurseries
class NurseryMailer < ApplicationMailer
  def first_request(registration)
    @nursery = registration.nursery
    @parents = registration.parents
    @child = registration.child

    mail(
      to: @nursery.mail,
      subject: 'Family would like to register'
    )
  end
end
