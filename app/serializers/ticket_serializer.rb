class TicketSerializer < ActiveModel::Serializer
  attributes :id, :subject, :status
  belongs_to :client
  belongs_to :technician
end
