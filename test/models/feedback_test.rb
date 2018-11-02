# frozen_string_literal: true

require 'test_helper'

class FeedbackTest < ActiveSupport::TestCase
  def setup
    @user = users(:first)
    @ticket = tickets(:first)
    @feedback_attrs = {
      ticket_id: @ticket.id,
      user_id: @user.id,
      message: 'Feedback'
    }
  end

  test 'create feedback' do
    assert Feedback.create(@feedback_attrs)
  end

  test 'invalid ticket_id' do
    @feedback_attrs[:ticket_id] = ''
    assert Feedback.create(@feedback_attrs).invalid?
  end

  test 'invalid user_id' do
    @feedback_attrs[:user_id] = ''
    assert Feedback.create(@feedback_attrs).invalid?
  end

  test 'invalid message' do
    @feedback_attrs[:message] = ''
    assert Feedback.create(@feedback_attrs).invalid?
  end
end
