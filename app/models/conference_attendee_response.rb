class ConferenceAttendeeResponse < ActiveRecord::Base
  belongs_to :attendee
  belongs_to :conference
end
