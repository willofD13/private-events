class RemoveGuestFromInvitations < ActiveRecord::Migration[7.1]
  def change
    remove_column :invitations, :guest_id, :integer
  end
end
