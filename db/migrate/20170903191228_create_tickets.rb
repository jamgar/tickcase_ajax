class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.text :subject
      t.integer :status, default: 0
      t.string :client_id
      t.string :technician_id

      t.timestamps
    end
  end
end
