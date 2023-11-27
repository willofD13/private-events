class GuestInviting < ApplicationRecord
    belongs_to :guest_invited, class_name: "User"
    belongs_to :guesting_invitation, class_name: "Invitation"
end
