class AddConferenceColumnsToQuestion < ActiveRecord::Migration
  def self.up
    add_column :questions, :conference_id, :integer
  end

  def self.down
    remove_column :questions, :conference_id
  end
end
