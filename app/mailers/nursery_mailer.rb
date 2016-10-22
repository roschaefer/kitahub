# Sends mails to nurseries
class NurseryMailer < ApplicationMailer
  def nursery_selected(registration)
    @nursery = registration.nursery
    @parents = registration.parents
    @child = registration.child

    mail(
      to: @nursery.mail,
      subject: "Family #{@parents} would like to register"
    )
  end
end
