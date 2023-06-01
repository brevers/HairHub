class SalesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_agency
  before_action :set_plan

  def create
    sale = Sale.new(plan: @plan, user: current_user)

    if sale.save
      # IMPORTANT:
      # The real workflow here would be different based on the payment provider
      # we choose. The way it ususally goes for most of them is:
      #
      # * The user gets redirected to the platform.
      # * The user makes a payment there

      # * You get a callback from the payment confirming the charge
      # * You confirm the sale in your system

      # TODO: Create a "Thank you" page and use that instead.
      redirect_to agency_path(@agency), notice: "Thanks for shopping with us! :)"
    else
      redirect_to agency_path(@agency), notice: "Something went wrong. Please try again later."
    end
  end

  private

    def set_agency
      @agency = Agency.find(params[:agency_id])
    end

    def set_plan
      @plan = @agency.plans.find(params[:plan_id])
    end
end
