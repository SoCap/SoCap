class CreateConferenceQuestions < ActiveRecord::Migration
  def self.up
    create_table :conference_questions do |t|
      t.references :conference
      t.references :question

      t.timestamps
    end
  end

  def self.down
    drop_table :conference_questions
  end
end
