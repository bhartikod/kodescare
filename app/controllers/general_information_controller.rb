# frozen_string_literal: false

class GeneralInformationController < ApplicationController
  def new
    @general_information = GeneralInformation.new
    @general_information.current_step = nil
  end

  def create
    @general_information = GeneralInformation.new(general_information_params)
    @general_information.current_step = params[:step]
    # @general_information.current_step = params[:general_information][:general_information_params]
    if @general_information.valid?
      if params[:back_button]
        @general_information.previous_step
      elsif @general_information.second_step?
        @general_information.save
        redirect_to "/users/sign_up?general_information_id=#{@general_information.id}"
      else
        @general_information.current_step = @general_information.next_step
        render 'new'
      end
    end
    flash[:notice] = 'general_info_params saved!' unless @general_information.new_record?
  end

  private

  def general_information_params
    params.require(:general_information).permit(:course, :attend, :class_type, :dob, :gender, :graduation_year, :full_time_work, :how_hear, :is_laptop)
  end
end
