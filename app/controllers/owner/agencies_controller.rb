module Owner
  class AgenciesController < ApplicationController
    before_action :authenticate_user!
    before_action :ensure_agency_owner!

    # GET /dashboard
    def dashboard
      @messages = current_user.agency.messages_grouped_by_user
      @plans = current_user.agency.plans
    end

    # GET /agencies/1 or /agencies/1.json
    def show
    end

    # GET /agencies/1/edit
    def edit
    end

    # PATCH/PUT /agencies/1 or /agencies/1.json
    def update
      respond_to do |format|
        if current_user.agency.update(agency_params)
          format.html { redirect_to owner_agency_url(@agency), notice: "Agency was successfully updated." }
          format.json { render :show, status: :ok, location: @agency }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @agency.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /agencies/1 or /agencies/1.json
    def destroy
      current_user.agency.destroy

      respond_to do |format|
        format.html { redirect_to owner_agencies_url, notice: "Agency was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    private

      # Only allow a list of trusted parameters through.
      def agency_params
        params.require(:agency).permit(:name, :pitch, :latitude, :longitude)
      end
  end
end
