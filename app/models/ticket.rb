class Ticket < ApplicationRecord
  belongs_to :client, class_name: 'User'
  belongs_to :technician, class_name: 'User'

  has_many :ticket_messages

  enum status: {
    open: 0,
    in_progress: 1,
    pending: 2,
    closed: 3
  }

  validates :subject, presence: true
  validates :content, presence: true

  scope :tickets_open, -> { where.not(status: :closed) }
  scope :tickets_closed, -> { where(status: :closed) }

end
