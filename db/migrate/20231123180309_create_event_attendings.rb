class CreateEventAttendings < ActiveRecord::Migration[7.1]
  def change
    create_table :event_attendings do |t|
      t.references :attended_event,  foreign_key: { to_table: :events }
      t.references :attendee,  foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
