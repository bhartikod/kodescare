# frozen_string_literal: false

# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!
ActionMailer::Base.default_url_options = { host: 'localhost' }
ActionMailer::Base.smtp_settings = {
  user_name: 'apikey',
  # i5GISpJsQAGu7KfftRIoaA
  # This is the string literal 'apikey', NOT the ID of your API key
  password: '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',
  # This is the secret sendgrid API key which was issued during API key creation
  domain: 'gmail.com',
  address: 'smtp.sendgrid.net',
  port: 587,
  authentication: :plain,
  enable_starttls_auto: true
}
