class CreateFeedbacks < ActiveRecord::Migration[5.0]
  def change
    create_table :feedbacks do |t|
      t.references :ticket, null: false
      t.references :user, null: false
      t.text :message, null: false

      t.timestamps
    end
  end
end
