class Event < ApplicationRecord
  default_scope { order(date: :asc) }
  # search
  include PgSearch::Model

  # shows whoever is participating in the event
  has_many :users, through: :plays

  has_many :plays, dependent: :destroy
  #  shows whoever created the event
  belongs_to :user

  # review
  has_many :reviews, dependent: :destroy

  has_one :chatroom, dependent: :destroy

  has_one_attached :photo

  geocoded_by :location

  after_validation :geocode, if: :will_save_change_to_location?

  validates :name, :description, :location, :date, presence: true
  validates :description, length: { minimum: 30 }

  pg_search_scope :search_by_name_location_and_sport,
                  against: [:sport, :location, :name],
                  using: { :tsearch => { :prefix => true } }

  def start_time
    self.date
  end
end
