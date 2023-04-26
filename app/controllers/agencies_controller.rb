class AgenciesController < ApplicationController
  before_action :set_agency, only: %i[ show ]

  # GET /agencies or /agencies.json
  def index
    @agencies = Agency.all
  end

  # GET /agencies/1 or /agencies/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agency
      @agency = Agency.find(params[:id])
    end
end
