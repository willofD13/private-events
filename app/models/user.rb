class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :created_events, foreign_key: "creator_id", class_name: "Event"
  has_many :event_attendings, foreign_key: :event_attendee_id
  has_many :attended_events, through: :event_attendings
  has_many :hosting_invitations, foreign_key: :host_id, class_name: "Event"
  has_many :guest_invitings, foreign_key: :guest_invited_id
  has_many :guesting_invitations, through: :guest_invitings
  
  validates :username, presence: true,uniqueness: true, length: { minimum: 5}
end
