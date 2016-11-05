# Sends mails to nurseries
class NurseryMailer < ApplicationMailer
  def first_request(registrations)
    @nursery = registrations.first.nursery
    @parents = registrations.first.parents
    @children = registrations.map(&:child)

    mail(
      to: @nursery.mail,
      subject: 'Family would like to register'
    )
  end
end
