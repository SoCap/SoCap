class OrganizerProfilesController < ApplicationController
  
  def profile
    @profile = current_organizer.organizer_profile
    if @profile.nil?
      redirect_to new_organizer_profile_path
    end
  end
  
  def show
    @profile = OrganizerProfile.find(params[:id])
    @education = @profile.education
  end
  
  def new
    @organizer_profile = OrganizerProfile.new
  end
  
  def create
    @organizer_profile = OrganizerProfile.new(params[:organizer_profile])
    profile = @organizer_profile.save
    organizer = current_organizer
    
    if profile
      organizer.update_attribute(:organizer_profile_id, @organizer_profile.id)
      organizer.save
      redirect_to organizer_root_path
    else
      render 'new'
      #redirect_to new_organizer_profile_path
    end
  end
  
end