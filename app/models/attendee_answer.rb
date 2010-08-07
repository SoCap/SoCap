class AttendeeAnswer < ActiveRecord::Base
  belongs_to :answer
  belongs_to :attendee
end
