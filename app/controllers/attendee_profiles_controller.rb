class AttendeeProfilesController < ApplicationController
  
  def profile
    @profile = current_attendee.attendee_profile
    @education = @profile.education
    if @profile.nil?
      redirect_to new_attendee_profile_path
    end
  end
  
  def show
    @profile = AttendeeProfile.find(params[:id])
    @education = @profile.education
  end
  
  def new
    @attendee_profile = AttendeeProfile.new
    @attendee_profile.build_education
  end
  
  def create
    @attendee_profile = AttendeeProfile.new(params[:attendee_profile])
    profile = @attendee_profile.save
    attendee = current_attendee
    
    if profile
      attendee.attendee_profile = @attendee_profile
      attendee.save
      redirect_to attendee_root_path
    else
      render 'new'
      #redirect_to new_attendee_profile_path
    end
  end
  
end