# frozen_string_literal: true

class Feedback < ApplicationRecord
  belongs_to :ticket, required: true
  belongs_to :user, required: true

  validates :message, presence: true, allow_nil: false
end
