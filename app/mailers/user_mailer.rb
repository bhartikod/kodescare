# frozen_string_literal: false

class UserMailer < ApplicationMailer
  default from: 'rahul@kliftox.com'
  def generate_otp(user)
    @user = user
    @url = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
