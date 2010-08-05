class CreateAttendeeProfiles < ActiveRecord::Migration
  def self.up
    create_table :attendee_profiles do |t|
      t.string :location
      t.references :education
      t.string :interests
      t.string :first_name, :last_name

      t.timestamps
    end
  end

  def self.down
    drop_table :attendee_profiles
  end
end
