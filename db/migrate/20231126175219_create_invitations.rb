class CreateInvitations < ActiveRecord::Migration[7.1]
  def change
    create_table :invitations do |t|

      t.timestamps
    end
  end
end
