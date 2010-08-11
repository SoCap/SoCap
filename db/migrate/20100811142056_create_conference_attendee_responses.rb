class CreateConferenceAttendeeResponses < ActiveRecord::Migration
  def self.up
    create_table :conference_attendee_responses do |t|
      t.references :attendee
      t.references :conference
      t.string :response

      t.timestamps
    end
  end

  def self.down
    drop_table :conference_attendee_responses
  end
end
