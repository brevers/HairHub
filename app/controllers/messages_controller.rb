class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_agency, except: [:index]

  def index
    @messages = Message.user_messages_grouped_by_agency(current_user)
  end

  def new
    @message = Message.new
  end

  def create
    message = Message.new(message_params)
    message.user = current_user
    message.agency = @agency

    @agency.messages << message

    if @agency.save
      redirect_to root_url, notice: "Message Sent"
    else
      render :new
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def set_agency
    @agency = Agency.find(params[:agency_id])
  end
end
