class AttendeesController < ApplicationController

  def profile
    @profile = current_attendee.attendee_profile
    @education = @profile.education
    if @profile.nil?
      redirect_to new_attendee_profile_path
    end
  end

  def conferences
    @conferences = current_attendee.conferences
  end
    
end