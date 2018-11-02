# frozen_string_literal: true

class TicketSerializer < ActiveModel::Serializer
  attributes :id, :sender_name, :subject, :message,
             :reference, :state, :created_at
end
