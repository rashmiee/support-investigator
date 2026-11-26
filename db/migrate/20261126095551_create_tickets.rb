class CreateTickets < ActiveRecord::Migration[8.1]
  def change
    create_table :tickets do |t|
      t.string :subject, null: false
      t.text :body, null: false
      t.string :customer_email, null: false
      t.string :status, null: false, default: "open"

      t.timestamps
    end
  end
end
