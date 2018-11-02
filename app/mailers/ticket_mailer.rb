# frozen_string_literal: true

class TicketMailer < ApplicationMailer
  def new_ticket(ticket)
    @ticket = ticket
    subject = "#{@ticket.subject}. reference: #{@ticket.reference}"
    mail(to: @ticket.sender_email, subject: subject)
  end
end
