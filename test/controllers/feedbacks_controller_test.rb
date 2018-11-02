# frozen_string_literal: true

require 'test_helper'

class FeedbacksontrollerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:first)
    @ticket = tickets(:first)
    @feedback_attrs = {
      feedback: {
        ticket_id: @ticket.id,
        user_id: @user.id,
        message: 'Feedback'
      }
    }
    sign_in @user
  end

  # POST feedbacks
  test 'should create feedback' do
    post '/feedbacks', params: @feedback_attrs

    assert_response :success
    assert_equal "{\"message\":\"Feedback\"}", response.body
  end

  test 'should not create feedback with absent ticket_id' do
    @feedback_attrs[:feedback][:ticket_id] = ''
    post '/feedbacks', params: @feedback_attrs

    assert_response :unprocessable_entity
    assert_equal "{\"ticket\":[\"must exist\"]}", response.body
  end

  test 'should not create feedback with absent user_id' do
    @feedback_attrs[:feedback][:user_id] = ''
    post '/feedbacks', params: @feedback_attrs

    assert_response :unprocessable_entity
    assert_equal "{\"user\":[\"must exist\"]}", response.body
  end

  test 'should not create feedback with empty message' do
    @feedback_attrs[:feedback][:message] = ''
    post '/feedbacks', params: @feedback_attrs

    assert_response :unprocessable_entity
    assert_equal "{\"message\":[\"can't be blank\"]}", response.body
  end
end
