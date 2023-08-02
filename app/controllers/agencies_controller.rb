# frozen_string_literal: true

class AgenciesController < ApplicationController
  before_action :set_agency, only: %i[show]

  # GET /agencies or /agencies.json
  def index
    @agencies = Agency.all

    respond_to do |format|
      format.html
      format.json { render json: @agencies }
    end
  end

  def update
    @agency = Agency.find(params[:id])
    if @agency.update(agency_params)
      redirect_to @agency, notice: 'Agency name was successfully updated.'
    else
      render :edit
    end
  end

  # GET /agencies/1 or /agencies/1.json
  def show; end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_agency
    @agency = Agency.find(params[:id])
  end

  def agency_params
    params.require(:agency).permit(:name, :other_attributes)
  end
end