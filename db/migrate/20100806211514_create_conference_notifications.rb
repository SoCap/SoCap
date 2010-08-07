class CreateConferenceNotifications < ActiveRecord::Migration
  def self.up
    create_table :conference_notifications do |t|
      t.references :conference
      t.references :attendee
      t.integer :count

      t.timestamps
    end
  end

  def self.down
    drop_table :conference_notifications
  end
end
