# frozen_string_literal: false

class DashboardController < ApplicationController
  def home
    cookies.permanent[:kodescare].present? ? existing_visitor : new_visitor
  rescue StandardError
    puts 'Some error'
  end

  def privacy_policy; end

  def about_us; end

  def contact_us; end

  def courses; end

  def stacks; end

  def courses_detail; end

  def designing_detail; end

  def developers; end

  # this method for send OTP by user mailer  throughout sendgrid
  def otp
    UserMailer.generate_otp(current_user).deliver_now
  end

  private

  def existing_visitor
    @visitor = Visitor.where(temp_email: cookies.permanent[:temp_email_adroit]).last
    @visitor.visits += 1
    @visitor.save
  end

  def new_visitor
    @visitor = Visitor.new
    @visitor.ip_address = request.ip
    @visitor.visits += 1
    @visitor.temp_email = "visitor_#{@visitor.id}@kodescare.com"
    cookies.permanent[:kodescare] = @visitor.save
    cookies.permanent[:temp_email_adroit] = "visitor_#{@visitor.id}@kodescare.com"
  end
end
