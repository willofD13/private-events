class CreateGuestInvitings < ActiveRecord::Migration[7.1]
  def change
    create_table :guest_invitings, id: false do |t|
      t.references :guesting_invitation, foreign_key: { to_table: :invitations }
      t.references :guest_invited, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
