# frozen_string_literal: false

class GeneralInformationController < ApplicationController
  before_action :authenticate_user!
  def new
    if GeneralInformation.exists?(user_id: current_user)
      redirect_to '/tests/new'
    else
      session[:general_information_params] ||= {}
      @general_information = GeneralInformation.new(session[:general_information_params])
      @general_information.current_step = params[:step]
    end
  end

  def create
    session[:general_information_params].deep_merge!(params[:general_information]) if params[:general_information]
    @general_information = GeneralInformation.new(session[:general_information_params])
    @general_information.user_id = current_user.id
    @general_information.current_step = params[:step]
    if @general_information.valid?

      if params[:back_button]
        @general_information.previous_step
        render 'new'
      elsif @general_information.second_step?
        @general_information.save
        flash[:notice] = 'general_info_params saved!' unless @general_information.new_record?
        redirect_to '/tests/new'
      else
        @general_information.current_step = @general_information.next_step
        render 'new'
      end
    end
  end

  private

  def general_information_params
    params.require(:general_information).permit(:course, :attend, :class_type, :dob, :gender, :graduation_year, :full_time_work, :how_hear, :is_laptop)
  end
end
