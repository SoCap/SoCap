class CreateEducations < ActiveRecord::Migration
  def self.up
    create_table :educations do |t|
      t.string :institution
      t.string :degree
      t.string :from
      t.string :to

      t.timestamps
    end
  end

  def self.down
    drop_table :educations
  end
end
