class CreateConferenceAttendees < ActiveRecord::Migration
  def self.up
    create_table :conference_attendees do |t|
      t.references :conference, :attendee
      t.timestamps
    end
  end

  def self.down
    drop_table :conference_attendees
  end
end
