class Ticket < ApplicationRecord
  enum status: [:open, :in_progress, :pending, :closed]

  validates :subject, presence: true

end
