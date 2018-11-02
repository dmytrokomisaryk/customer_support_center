# frozen_string_literal: true

class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.string :sender_email
      t.string :sender_name
      t.text :subject
      t.text :message
      t.integer :state, default: Ticket.states[:pending]

      t.timestamps
    end
  end
end
