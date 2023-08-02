# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :setup_devise_params, if: :devise_controller?

  def ensure_agency_owner!
    redirect_to root_url unless current_user.owner?
  end

  def ensure_registered_owner!
    redirect_to new_owner_registration_path unless current_user&.owner?
  end

  def setup_devise_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
  end
end
