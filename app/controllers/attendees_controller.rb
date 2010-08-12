class AttendeesController < ApplicationController

  def profile
    attendee = current_attendee
    p "################################################"
    p attendee
    @profile = attendee.attendee_profile
    p @profile
    if @profile.nil?
      redirect_to new_attendee_profile_path
      return
    end
    @education = @profile.education
  end

  def show
  end

  def conferences
    @attendee = current_attendee
    @conferences = @attendee.conferences
  end
  
  def add_to_conference
    
  end
    
end

