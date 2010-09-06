class ConferenceAttendeeResponse < ActiveRecord::Base
  belongs_to :attendee
  belongs_to :conference
  validates_uniqueness_of :attendee_id, :scope => :conference_id
  
  def match
    responses = ConferenceAttendeeResponse.where("conference_id = ? AND attendee_id != ?", self.conference_id, self.attendee_id)
    matches = 0
    if self.response.blank?
      return false
    end
    response = self.response.chars.to_a
    responses.each do |r|
      matched = 0
      r.response.chars.to_a.each_with_index do |c, i|
        if response[i] == c
          matched += 1
        end
      end
      matched = (matched/response.length.to_f) * 100
      match = MatchedConferenceAttendee.new(:attendee_id => self.attendee_id, :attendee_profile_id => r.attendee.attendee_profile_id, :conference_id => self.conference_id, :matched => matched)
      match.save
      reverse_match = MatchedConferenceAttendee.new(:attendee_id => r.attendee_id, :attendee_profile_id => self.attendee.attendee_profile_id, :conference_id => self.conference_id, :matched => matched) 
      reverse_match.save
    end
    return true
  end
  
  def answers
    conference = self.conference
    questions = conference.questions
    answers = []
    response = self.response.chars.to_a
    questions.each do |q|
      answers << response.first
      q.weight.times do
        response.delete_at 0
      end
    end
    return answers
  end
  
end
