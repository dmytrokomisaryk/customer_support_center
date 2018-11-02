# frozen_string_literal: true

class FeedbacksController < ApplicationController
  def create
    feedback = CreateFeedback.new(feedback_params).call
    if feedback.errors.present?
      render json: feedback.errors, status: :unprocessable_entity
    else
      render json: feedback
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:ticket_id, :user_id, :message)
  end
end
