class CreateEventAttendings < ActiveRecord::Migration[7.1]
  def change
    create_table :event_attendings do |t|

      t.timestamps
    end
  end
end
