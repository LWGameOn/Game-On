class Event < ApplicationRecord
  # search
  include PgSearch::Model

  # shows whoever is participating in the event
  has_many :users, through: :plays
  #  shows whoever created the event
  belongs_to :user

  has_one :chatroom, dependent: :destroy

  has_one_attached :photo

  geocoded_by :location

  after_validation :geocode, if: :will_save_change_to_location?

  validates :name, :description, :location, :date, presence: true
  validates :description, length: { minimum: 30 }

  pg_search_scope :search_by_name_location_and_sport,
                  against: [:sport, :location, :name],
                  using: { :tsearch => { :prefix => true } }
end
