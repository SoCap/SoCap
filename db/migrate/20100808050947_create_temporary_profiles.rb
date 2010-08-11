class CreateTemporaryProfiles < ActiveRecord::Migration
  def self.up
    create_table :temporary_profiles do |t|
      t.references :attendee
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end

  def self.down
    drop_table :temporary_profiles
  end
end
