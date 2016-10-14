# Provides a sandbox for mails on staging by changing to recipient.
class StagingEmailInterceptor
  def self.delivering_email(message)
    message.to = ['info@kitahub.de']
  end
end
