class CreateMatchedConferenceAttendees < ActiveRecord::Migration
  def self.up
    create_table :matched_conference_attendees do |t|
      t.references :conference
      t.references :attendee
      t.references :attendee_profile

      t.timestamps
    end
  end

  def self.down
    drop_table :matched_conference_attendees
  end
end
