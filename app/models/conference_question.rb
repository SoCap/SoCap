class ConferenceQuestion < ActiveRecord::Base
  belongs_to :conference
  belongs_to :question
  has_one :organizer, :through => :conference
  
end
