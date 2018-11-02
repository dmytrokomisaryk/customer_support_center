# frozen_string_literal: true

class TicketsController < ApplicationController
  def index
    tickets = Ticket.search(search_params)
    total_count = Ticket.count_by_params(search_params)
    response_data = {
      current_page: params.fetch(:page, 1),
      per_page: params.fetch(:per_page, Ticket::DEFAULT_PER_VALUE),
      total_count: total_count,
      tickets: tickets
    }
    render json: response_data
  end

  def create
    ticket = CreateTicket.new(ticket_params).call
    if ticket.errors.present?
      render json: ticket.errors, status: :unprocessable_entity
    else
      render json: ticket
    end
  end

  private

  def ticket_params
    params.require(:ticket).permit(:sender_email, :sender_name,
                                   :subject, :message)
  end

  def search_params
    params.permit(:state, :query, :page, :per_page)
  end
end
