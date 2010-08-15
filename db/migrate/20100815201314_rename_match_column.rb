class RenameMatchColumn < ActiveRecord::Migration
  def self.up
    remove_column :matched_conference_attendees, :match
  end

  def self.down
    add_column :matched_conference_attendees, :match, :integer
  end
end
