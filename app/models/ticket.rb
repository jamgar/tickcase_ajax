class Ticket < ApplicationRecord
  belongs_to :client_id, class_name: 'User'
  belongs_to :technician_id, class_name: 'User'

  enum status: [:open, :in_progress, :pending, :closed]

  validates :subject, presence: true

end
