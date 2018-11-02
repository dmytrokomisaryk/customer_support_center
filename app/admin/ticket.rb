# frozen_string_literal: true

ActiveAdmin.register Ticket do
  index do
    selectable_column
    id_column
    column :sender_email
    column :sender_name
    column :subject
    column :message
    column :reference
    actions
  end

  filter :sender_email
  filter :sender_name
  filter :subject
  filter :message
  filter :reference
end
