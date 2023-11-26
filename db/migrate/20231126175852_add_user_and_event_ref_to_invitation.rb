class AddUserAndEventRefToInvitation < ActiveRecord::Migration[7.1]
  def change
    change_table :invitations do
    add_reference :invitations, :event, foreign_key: :true
    add_reference :invitations, :guest, foreign_key: { to_table: :users }
    end
  end
end
