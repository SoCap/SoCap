class AttendeeProfilesController < ApplicationController
  
  def show
    @profile = AttendeeProfile.find(params[:id])
    @education = @profile.education if !@profile.nil?
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
      p "################################################"
      attendee.attendee_profile = @attendee_profile
      attendee.save
      redirect_to attendee_root_path
    else
      flash[:error] = "<p>There were problems with your submission</p>"
      render 'new'
    end
  end
  
  def edit
    @attendee_profile = current_attendee.attendee_profile
  end
  
  def update
    attendee_profile = current_attendee.attendee_profile
    attendee_profile.update_attributes(params[:attendee_profile])
    redirect_to attendee_root_path
  end
  
end