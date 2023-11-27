class CreateGuestInvitings < ActiveRecord::Migration[7.1]
  def change
    create_table :guest_invitings do |t|

      t.timestamps
    end
  end
end
