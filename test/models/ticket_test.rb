# frozen_string_literal: true

require 'test_helper'

class TicketTest < ActiveSupport::TestCase
  def setup
    @ticket_attrs = {
      sender_email: "jon_#{Time.now.to_i}@example.com",
      sender_name: 'Jon Doe',
      subject: 'Need help!',
      message: 'Plesase help me'
    }
  end

  test 'create ticket' do
    assert Ticket.create(@ticket_attrs)
  end

  test 'invalid email' do
    @ticket_attrs[:sender_email] = 'invalid_email'
    assert Ticket.create(@ticket_attrs).invalid?
  end

  test 'invalid name' do
    @ticket_attrs[:sender_name] = ''
    assert Ticket.create(@ticket_attrs).invalid?
  end

  test 'invalid subject' do
    @ticket_attrs[:subject] = ''
    assert Ticket.create(@ticket_attrs).invalid?
  end

  test 'invalid message' do
    @ticket_attrs[:message] = ''
    assert Ticket.create(@ticket_attrs).invalid?
  end
end
