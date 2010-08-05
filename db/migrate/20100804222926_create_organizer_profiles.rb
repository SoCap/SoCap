class CreateOrganizerProfiles < ActiveRecord::Migration
  def self.up
    create_table :organizer_profiles do |t|
      t.string :location
      t.string :company
      t.string :first_name, :last_name

      t.timestamps
    end
  end

  def self.down
    drop_table :organizer_profiles
  end
end
