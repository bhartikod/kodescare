# frozen_string_literal: false

class ApplicationMailer < ActionMailer::Base
  default from: 'example@gmail.com'
  layout 'mailer'
end
