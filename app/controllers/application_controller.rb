# frozen_string_literal: false

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[name id_proof contact_num verification_code select_id_proof enter_id_number
                                               document_link])
  end

  # This method call for vaildate test if present?
  def validate_test_path
    redirect_to general_informations_path unless current_user&.general_information
  end

  # After signUp path it's redirect to users/otp/path
  def after_sign_up_path_for(_resource)
    user_otp_path
  end
end
