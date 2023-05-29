module Owner
  class PlansController < ApplicationController
    before_action :authenticate_user!
    before_action :set_agency, except: [:index]

    def new
    end

    def create
      plan = Plan.new(plan_params)
      @agency.plans << plan

      if @agency.save
        redirect_to owner_agency_dashboard_path(current_user.agency), notice: "Plan created"
      else
        render :new
      end
    end

    private

    def plan_params
      params.require(:plan).permit(:title, :description, :price)
    end

    def set_agency
      @agency = Agency.find(params[:agency_id])
    end
  end
end

