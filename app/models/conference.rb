class Conference < ActiveRecord::Base
  belongs_to :organizer
  has_many :attendees, :through => :conference_attendees
  has_many :conference_questions
  has_many :conference_notifications
  
end
