class PlansController < ApplicationController
    before_action :set_plan, only: %i[show edit update destroy]
    before_action :set_agency
  
    # GET /plans or /plans.json
    def index
      @plans = @agency.plans.all
    end
  
    # GET /plans/1 or /plans/1.json
    def show; end
  
    # GET /plans/new
    def new
      @plan = @agency.plans.new
    end
  
    # GET /plans/1/edit
    def edit; end
  
    # POST /plans or /plans.json
    def create
      @plan = Plan.new(plan_params)
  
      respond_to do |format|
        if @plan.save
          format.html { redirect_to agency_plan_url(@agency, @plan), notice: "Plan was successfully created." }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /plans/1 or /plans/1.json
    def update
      respond_to do |format|
        if @plan.update(plan_params)
          format.html { redirect_to agency_plan_url(@agency, @plan), notice: "Plan was successfully updated." }
        else
          format.html { render :edit, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /plans/1 or /plans/1.json
    def destroy
      @plan.destroy
  
      respond_to do |format|
        format.html { redirect_to agency_plans_url(@agency), notice: "Plan was successfully destroyed." }
      end
    end
  
    private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_plan
      @plan = Plan.find(params[:id])
    end
  
    def set_agency
      @agency = Agency.find(params[:agency_id])
    end
  
    # Only allow a list of trusted parameters through.
    def plan_params
      params.require(:plan).permit(:title, :description, :image, :price, :agency_id)
    end
  end
  