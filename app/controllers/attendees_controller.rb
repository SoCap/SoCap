class AttendeesController < ApplicationController

  def profile
    attendee = current_attendee
    p "################################################"
    p "################################################"
    p "################################################"
    p "################################################"
    p "################################################"
    p current_attendee
    p "################################################"
    p "################################################"
    p "################################################"
    p "################################################"
    p "################################################"
    
    @profile =  attendee.profile
    @education = @profile.education
    if @profile.nil?
      redirect_to new_attendee_profile_path
    end
  end

  def conferences
    @attendee = current_attendee
    @conferences = @attendee.conferences
  end
  
  def add_to_conference
    
  end
    
end

