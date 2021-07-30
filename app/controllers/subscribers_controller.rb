# frozen_string_literal: false

class SubscribersController < ApplicationController
  def create
    @subscriber = Subscriber.create(params_subscriber)
    @msg = if @subscriber.persisted?
             'Will will get back to you shortly!'
           else
             @subscriber.errors.full_messages.first
           end
    @response = @subscriber.persisted? ? 'success' : 'error'
  end

  private

  def params_subscriber
    params.permit(:email)
  end
end
