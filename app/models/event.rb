class Event < ApplicationRecord
  # shows whoever created the event
  belongs_to :user

  # shows whoever is participating in the event
  has_many :users, through: :plays
end
