# frozen_string_literal: true

module Owner
    class ClaimsController < ApplicationController
      before_action :ensure_registered_owner!
  
      before_action :set_agency, only: :create
  
      def create
        if current_user.claim(@agency)
          redirect_to owner_dashboard_path, notice: "Success!"
        else
          redirect_to root_url, notice: "Something went wrong. Please try again later."
        end
      end
  
      private
  
      def set_agency
        @agency = Agency.new(agency_params)
      end
  
      def agency_params
        params.require(:agency).permit(:latitude, :longitude)
      end
    end
  end