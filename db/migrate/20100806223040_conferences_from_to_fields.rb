class ConferencesFromToFields < ActiveRecord::Migration
  def self.up
    remove_column :conferences, :from
    remove_column :conferences, :to
    add_column :conferences, :start_date, :datetime
    add_column :conferences, :end_date, :datetime
  end

  def self.down
    remove_column :conferences, :start_date
    remove_column :conferences, :end_date
    add_column :conferences, :from, :datetime
    add_column :conferences, :to, :datetime
  end
end
