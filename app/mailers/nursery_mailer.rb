# Sends mails to nurseries
class NurseryMailer < ApplicationMailer
  def nursery_selected(nursery, parents)
    @nursery = nursery
    @parents = parents

    mail(
      to: @nursery.mail,
      subject: "Family #{@parents} would like to register"
    )
  end
end
