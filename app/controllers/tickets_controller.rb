class TicketsController < ApplicationController
  def index
    @tickets = Ticket.inbox
  end
end
