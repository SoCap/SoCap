class MatchedConferenceAttendee < ActiveRecord::Base
  belongs_to :conference
  belongs_to :attendee
  belongs_to :attendee_profile
end
