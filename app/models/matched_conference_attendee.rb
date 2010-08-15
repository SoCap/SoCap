class MatchedConferenceAttendee < ActiveRecord::Base
  belongs_to :conference
  belongs_to :attendee
  belongs_to :attendee_profile
  validates_uniqueness_of :attendee_id, :scope => [:attendee_profile_id, :conference_i]
end
