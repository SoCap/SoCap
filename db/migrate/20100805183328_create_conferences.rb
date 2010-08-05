class CreateConferences < ActiveRecord::Migration
  def self.up
    create_table :conferences do |t|
      t.string :title
      t.text :details
      t.string :location
      t.datetime :from
      t.datetime :to
      t.references :organizer

      t.timestamps
    end
  end

  def self.down
    drop_table :conferences
  end
end
