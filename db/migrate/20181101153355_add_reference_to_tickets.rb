class AddReferenceToTickets < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :reference, :string
  end
end