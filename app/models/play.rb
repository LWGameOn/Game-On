class Play < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :user, uniqueness: { scope: :event,
            message: "you already joined this event" }
end
