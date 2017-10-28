class TicketsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @tickets = @tickets.tickets_open
    respond_to do |f|
      f.html { render :index }
      f.json { render json: @tickets}
    end
  end

  def new
    @ticket = Ticket.new
  end

  def show
    @ticket_messages = @ticket.ticket_messages.order(created_at: :desc)
    respond_to do |f|
      f.html { render :show }
      f.json { render json: @ticket}
    end
  end

  def closed
    @tickets = @tickets.tickets_closed
  end

  def create
    @ticket.client = current_user
    @ticket.technician = User.get_technician[0]
    if @ticket.save
      flash[:notice] = "Ticket was successfully created!"
      redirect_to @ticket
    else
      flash[:alert] = "Ticket was not created!"
      render :new
    end
  end

  def edit
  end

  def update
    if @ticket.update(ticket_params)
      flash[:notice] = "Ticket was successfully updated!"
      redirect_to @ticket
    else
      flash[:alert] = "Ticket was not updated!"
      render :edit
    end
  end

  def destroy
    # Admin should only be the ones allowed to delete a ticket
    @ticket.destroy
    redirect_to root_path
  end

  private
    def ticket_params
      params.require(:ticket).permit(:subject, :status, :content, :client_id, :technician_id)
    end

    def set_ticket
      @ticket = Ticket.find(params[:id])
    end
end
