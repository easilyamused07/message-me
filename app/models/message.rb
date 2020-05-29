class Message < ApplicationRecord
  belongs_to :user
  validates :body, presence: true
  scope :limit_messages, -> {order(:created_at).last(20)}
end
