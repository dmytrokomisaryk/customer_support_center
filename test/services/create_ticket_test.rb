# frozen_string_literal: true

require 'test_helper'

class CreateTicketTest < ActiveSupport::TestCase
  def setup
    @ticket_attrs = {
      sender_email: "jon_#{Time.now.to_i}@example.com",
      sender_name: 'Jon Doe',
      subject: 'Need help!',
      message: 'Plesase help me'
    }

    @create_ticket_service = CreateTicket.new(@ticket_attrs)
  end

  test 'create ticket' do
    assert @create_ticket_service.call
  end

  test 'create ticket with reference' do
    ticket = @create_ticket_service.call
    assert_not_nil ticket.reference
  end
end
