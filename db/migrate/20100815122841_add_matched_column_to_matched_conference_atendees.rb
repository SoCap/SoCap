class AddMatchedColumnToMatchedConferenceAtendees < ActiveRecord::Migration
  def self.up
    add_column :matched_conference_attendees, :matched, :integer
  end

  def self.down
    remove_column :matched_conference_attendees, :matched
  end
end
