class Chatroom < ApplicationRecord
  include PgSearch::Model

  belongs_to :event
  has_many :messages, dependent: :destroy

  pg_search_scope :search_by_event_name,
                  associated_against: {
                    event: [ :name, :sport ]
                  },
                  using: { :tsearch => { :prefix => true } }
end
