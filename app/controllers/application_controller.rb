class ApplicationController < ActionController::Base
    
  def ensure_agency_owner!
    redirect_to root_url unless current_user.owner?
  end
end
