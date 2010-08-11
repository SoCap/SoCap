class Conference < ActiveRecord::Base
  validates_presence_of :start_date, :end_date, :title, :details, :location
  after_validation :start_date_before_end_date
  belongs_to :organizer
  has_many :conference_attendees
  has_many :attendees, :through => :conference_attendees
  has_many :questions
  has_many :conference_notifications
  has_many :conference_attendee_responses
  accepts_nested_attributes_for :questions, :reject_if => lambda {|a| a[:text].blank?}, :allow_destroy => true
  accepts_nested_attributes_for :attendees, :reject_if => lambda {|a| a[:text].blank?}
  attr_writer :current_step
  
  has_attached_file :logo, 
                    :storage => :s3, 
                    :s3_credentials => "config/s3.yml",
                    :path => "/:style/:filename",
                    :styles => {:profile => "150x150"}

  def start_date_before_end_date
    errors.add(:end_date, "must be after the start date") if 
      self.start_date > self.end_date
  end

  def current_step
    @current_step || steps.first
  end

  def steps
    %w[details questions attendees confirmation]    
  end
  
  def next_step
    self.current_step = steps[steps.index(current_step)+1]
  end

  def previous_step
    self.current_step = steps[steps.index(current_step)-1]
  end
  
  def first_step?
    current_step == steps.first
  end
  
  def last_step?
    current_step == steps.last
  end
  
  def details?
    self.current_step == "details"
  end
  
  def all_valid?
    steps.all? do |step|
      self.current_step = step
      valid?
    end
  end
end
