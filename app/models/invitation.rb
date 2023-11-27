class Invitation < ApplicationRecord
    belongs_to :event
    belongs_to :host, class_name: "User"
    has_many :guest_invitings, foreign_key: :guesting_invitation_id
    has_many :guests, through: :guest_invitings, source: :guest_invited
end
