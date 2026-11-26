class Ticket < ApplicationRecord
  enum :status, { open: "open", investigating: "investigating", answered: "answered" }, validate: true

  validates :subject, :body, :customer_email, presence: true

  scope :inbox, -> { order(created_at: :desc) }
end
