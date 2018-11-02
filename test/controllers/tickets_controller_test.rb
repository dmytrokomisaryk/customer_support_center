# frozen_string_literal: true

require 'test_helper'

class TicketsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:first)
    sign_in @user

    @ticket_attrs = {
      ticket: {
        sender_email: "Jon_#{Time.now.to_i}@example.com",
        sender_name: 'Jon Doe',
        subject: 'Subject',
        message: 'Message'
      }
    }
    @response_data = {
      "current_page" => 1,
      "per_page" => 5,
      "total_count" => 0,
      "tickets" => []
    }
  end

  # GET /tickets
  test 'should get all tickets' do
    ticket = tickets(:first)
    tickets(:fake_user)

    query = ticket.sender_name
    get '/tickets', params: { query: query }

    response_json = JSON.parse(response.body)
    assert_response :success
    assert_equal response_json['current_page'], 1
    assert_equal response_json['per_page'], Ticket::DEFAULT_PER_VALUE
    assert_equal response_json['total_count'], 1
    assert_equal response_json['tickets'], [JSON.parse(ticket.to_json)]
  end

  test 'should respond empty list' do
    Ticket.destroy_all

    get '/tickets', params: {}

    assert_response :success
    assert_equal @response_data, JSON.parse(response.body)
  end

  # POST /tickets
  test 'should create ticket' do
    post '/tickets', params: @ticket_attrs

    assert_response :success
    ticket = Ticket.find_by(sender_email: @ticket_attrs[:ticket][:sender_email])
    serialization = JSON.parse(TicketSerializer.new(ticket).to_json)
    assert_equal serialization, JSON.parse(response.body)
  end

  test 'should not create ticket with empty sender_email' do
    @ticket_attrs[:ticket][:sender_email] = ''
    post '/tickets', params: @ticket_attrs

    assert_response :unprocessable_entity
    errors = "{\"sender_email\":[\"can't be blank\",\"is invalid\"]}"
    assert_equal errors, response.body
  end

  test 'should not create ticket with empty sender_name' do
    @ticket_attrs[:ticket][:sender_name] = ''
    post '/tickets', params: @ticket_attrs

    assert_response :unprocessable_entity
    errors = "{\"sender_name\":[\"can't be blank\"]}"
    assert_equal errors, response.body
  end

  test 'should not create ticket with empty subject' do
    @ticket_attrs[:ticket][:subject] = ''
    post '/tickets', params: @ticket_attrs

    assert_response :unprocessable_entity
    errors = "{\"subject\":[\"can't be blank\"]}"
    assert_equal errors, response.body
  end

  test 'should not create ticket with empty message' do
    @ticket_attrs[:ticket][:message] = ''
    post '/tickets', params: @ticket_attrs

    assert_response :unprocessable_entity
    errors = "{\"message\":[\"can't be blank\"]}"
    assert_equal errors, response.body
  end
end
