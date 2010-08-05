class OrganizerProfile < ActiveRecord::Base
  validates_presence_of :first_name, :last_name
  has_one :organizer
end
