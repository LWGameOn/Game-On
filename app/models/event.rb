class Event < ApplicationRecord
  # shows whoever is participating in the event
  has_many :users, through: :plays
  #  shows whoever created the event
  belongs_to :user

  has_many :messages

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  validates :name, :description, :location, :date, :time, presence: true
  validates :description, length: { minimum: 30 }
end
