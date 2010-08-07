class CreateAttendeeAnswers < ActiveRecord::Migration
  def self.up
    create_table :attendee_answers do |t|
      t.references :answer
      t.references :attendee

      t.timestamps
    end
  end

  def self.down
    drop_table :attendee_answers
  end
end
