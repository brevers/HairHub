module Owner
  class PlansController < ApplicationController
    before_action :authenticate_user!
    before_action :set_agency, except: [:index]
    before_action :set_plan, only: [:destroy]

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

    def destroy
      if @plan.delete
        redirect_to owner_agency_dashboard_path(current_user.agency),
          notice: "Plan successfully removed"
      else
        redirect_to owner_agency_dashboard_path(current_user.agency),
          notice: "Fail to remove the plan"
      end
    end

    private

    def plan_params
      params.require(:plan).permit(:title, :description, :price)
    end

    def set_agency
      @agency = Agency.find(params[:agency_id])
    end

    def set_plan
      @plan = @agency.plans.find(params[:id])
    end
  end
end

