class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]


  def index
    @tickets = Ticket.all
  end

  def new
    @ticket = Ticket.new
  end

  def show
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.client = current_user
    @ticket.technician = current_user
    if @ticket.save
      flash[:notice] = "Your ticket was created successfully!"
      redirect_to @ticket
    else
      flash[:alert] = "Your ticket was not created!"

      render :new
    end
  end

  private
    def ticket_params
      params.require(:ticket).permit(:subject, :status, :content, :client_id, :technician_id)
    end

    def set_ticket
      @ticket = Ticket.find(params[:id])
    end
end
