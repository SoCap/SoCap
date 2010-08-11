class AttendeeProfile < ActiveRecord::Base
  validates_presence_of :first_name, :last_name
  
  belongs_to :education, :dependent => :destroy
  has_one :attendee
  
  has_attached_file :photo, 
                    :storage => :s3, 
                    :s3_credentials => "config/s3.yml",
                    :path => "/:style/:filename",
                    :styles => {:profile => "150x150"}
  
  accepts_nested_attributes_for :education

end
