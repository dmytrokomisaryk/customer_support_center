# frozen_string_literal: true

class FeedbackMailer < ApplicationMailer
  def new_feedback(feedback)
    @feedback = feedback
    @user = @feedback.user
    @ticket = @feedback.ticket
    subject = "#{@ticket.subject}. reference: #{@ticket.reference}"
    mail(from: @user.email, to: @ticket.sender_email, subject: subject)
  end
end
