# frozen_string_literal: true

class CreateFeedback
  def initialize(attributes)
    @attributes = attributes
  end

  def call
    feedback = Feedback.create(attributes)
    if feedback.valid?
      send_email(feedback)
      feedback.ticket.replied!
    end
    feedback
  end

  private

  attr_reader :attributes

  def send_email(feedback)
    FeedbackMailer.new_feedback(feedback).deliver
  end
end
