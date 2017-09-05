class UpdateClientTechnicianIdForTickets < ActiveRecord::Migration[5.1]
  def change
    change_column :tickets, :client_id, :integer
    change_column :tickets, :technician_id, :integer
  end
end
