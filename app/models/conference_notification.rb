class ConferenceNotification < ActiveRecord::Base
  belongs_to :conference
  belongs_to :attendee
end
