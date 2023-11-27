class AddHostRefToInvitations < ActiveRecord::Migration[7.1]
  def change
    add_reference :invitations, :host, foreign_key: { to_table: :users }
  end
end
