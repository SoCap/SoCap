class AttendeeProfile < ActiveRecord::Base
  validates_presence_of :first_name, :last_name
  
  belongs_to :education, :dependent => :destroy
  has_one :attendee
  
  accepts_nested_attributes_for :education

end
