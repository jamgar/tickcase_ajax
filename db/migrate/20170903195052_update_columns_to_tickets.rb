class UpdateColumnsToTickets < ActiveRecord::Migration[5.1]
  def change
    change_column :tickets, :subject, :string
    add_column :tickets, :content, :text
  end
end
