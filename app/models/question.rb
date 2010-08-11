class Question < ActiveRecord::Base
  validates_presence_of :text, :weight
  
  has_many :answers, :dependent => :destroy
  belongs_to :conference
  accepts_nested_attributes_for :answers, :reject_if => lambda {|a| a[:text].blank?}, :allow_destroy => true
  
end
