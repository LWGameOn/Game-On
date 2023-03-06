class Event < ApplicationRecord
  has_many :messages
  belong_to :user

  validates :name, :description, :address, :date, :time, presence: true
  validates :description, length: { minimum: 30 }
end
