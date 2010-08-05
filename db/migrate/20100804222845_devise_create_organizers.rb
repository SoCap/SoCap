class DeviseCreateOrganizers < ActiveRecord::Migration
  def self.up
    create_table(:organizers) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable
      t.references :organizer_profile

      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable

      t.timestamps
    end

    add_index :organizers, :email,                :unique => true
    add_index :organizers, :reset_password_token, :unique => true
    # add_index :organizers, :confirmation_token,   :unique => true
    # add_index :organizers, :unlock_token,         :unique => true
  end

  def self.down
    drop_table :organizers
  end
end
