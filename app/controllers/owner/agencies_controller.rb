# frozen_string_literal: true

module Owner
  class AgenciesController < ApplicationController
    before_action :authenticate_user!
    before_action :ensure_agency_owner!
    before_action :set_agency, except: :dashboard

    # GET /dashboard
    def dashboard
      @agencies = current_user.agencies
    end

    # GET /agencies/1 or /agencies/1.json
    def show; end

    # GET /agencies/1/edit
    def edit; end

    # PATCH/PUT /agencies/1 or /agencies/1.json
    def update
      respond_to do |format|
        if @agency.update(agency_params)
          format.html { redirect_to owner_agency_url(@agency), notice: 'Agency was successfully updated.' }
          format.json { render :show, status: :ok, location: @agency }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @agency.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /agencies/1 or /agencies/1.json
    def destroy
      @agency.destroy

      respond_to do |format|
        format.html { redirect_to owner_agencies_url, notice: 'Agency was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    def set_agency
      @agency = current_user.agencies.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def agency_params
      params.require(:agency).permit(:name, :pitch, :latitude, :longitude)
    end
  end
end
