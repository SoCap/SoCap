class DeviseCreateAttendees < ActiveRecord::Migration
  def self.up
    create_table(:attendees) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable
      t.references :attendee_profile

      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable

      t.timestamps
    end

    add_index :attendees, :email,                :unique => true
    add_index :attendees, :reset_password_token, :unique => true
    # add_index :attendees, :confirmation_token,   :unique => true
    # add_index :attendees, :unlock_token,         :unique => true
  end

  def self.down
    drop_table :attendees
  end
end
