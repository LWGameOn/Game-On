class Event < ApplicationRecord
  # shows whoever is participating in the event
  has_many :users, through: :plays
  #  shows whoever created the event
  belongs_to :user

  has_many :messages

  validates :name, :description, :location, :date, :time, presence: true
  validates :description, length: { minimum: 30 }
end
