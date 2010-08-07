class OrganizersController < ApplicationController

  def profile
    @profile = current_organizer.organizer_profile
    if @profile.nil?
      redirect_to new_organizer_profile_path
    end
  end
  
  def conferences
    @organizer = current_organizer
    @conferences = @organizer.conferences
  end

end