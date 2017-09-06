class TicketMessagesController < ApplicationController
  before_action :find_message
  def new
    @ticket_message = TicketMessage.new
  end

  def create
    @ticket_message = @ticket.ticket_messages.new(message_params)
    @ticket_message.user = current_user
    if @ticket_message.save
      redirect_back(fallback_location: (request.referer || root_path),
                    notice: "Your message was saved!")
    else
      redirect_back(fallback_location: (request.referer || root_path),
                    notice: "You message was not saved!")
    end
  end

  private
    def message_params
      params.require(:ticket_message).permit(:user_id, :ticket_id, :content)
    end

    def find_message
      @ticket = Ticket.find_by_id(params[:ticket_id]) if params[:ticket_id]
    end
end
