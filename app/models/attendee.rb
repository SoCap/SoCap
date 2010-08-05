class Attendee < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation
  belongs_to :attendee_profile, :dependent => :destroy
  has_many :attendee_answers
  has_many :matched_conferenc_attendees
  has_many :conferences, :through => :conference_attendees
  
  accepts_nested_attributes_for :attendee_profile
  
end
