class Event < ApplicationRecord
  # shows whoever is participating in the event
  has_many :users, through: :plays
  #  shows whoever created the event
  belongs_to :user

  has_one :chatroom, dependent: :destroy

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  validates :name, :description, :location, :date, presence: true
  validates :description, length: { minimum: 30 }
end
