class AddNotifiedColumnConferenceAttendees < ActiveRecord::Migration
  def self.up
    add_column :confernece_attendees, :notified, :boolean, :default => false
  end

  def self.down
    remove_column :confernece_attendees, :notified
  end
end
