# frozen_string_literal: true

class CreateTicket
  def initialize(attributes)
    @attributes = attributes
  end

  def call
    ticket = Ticket.create(attributes.merge(addition_attributes))
    send_email(ticket) if ticket.valid?
    ticket
  end

  private

  attr_reader :attributes

  def addition_attributes
    {
      reference: generate_reference
    }
  end

  def generate_reference
    reference = Reference::Builder.new.generate
    generate_reference if Ticket.exists?(reference: reference)
    reference
  end

  def send_email(ticket)
    TicketMailer.new_ticket(ticket).deliver
  end
end
