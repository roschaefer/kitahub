# frozen_string_literal: true
# Root class of all mailers in the application.
class ApplicationMailer < ActionMailer::Base
  default from: 'info@kitahub.de'
  layout 'mailer'
end
