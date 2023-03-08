class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   # Since we can't have two different "has_many :events" definitions, we should
  # distinguish between participation and event ownership
  # shows whoever has created the events
  has_many :event_invites, foreign_key: 'user_id', class_name: 'Event'

  # shows whoever is participating in the event
  has_many :events, through: :plays

  has_many :plays

  has_one_attached :avatar, dependent: :destroy

end
