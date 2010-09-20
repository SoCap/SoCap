class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :detect_ie
  
  # def after_sign_in_path_for(resource)
  #   if resource.role.name == "Attendee"
  #   
  #   elsif resource.role.name == "Organizer"
  #     
  #   else
  #     
  #   end
  #     
  # end
  
  def errors_to_flash(errors)
    flash[:error] = "<p>There were problems with the following fields:</p>"
    spacing = ""
    13.times {spacing += "&nbsp"}
    errors.each do |k, v|    
      flash[:error] += "#{spacing}<strong>#{k.to_s.humanize}</strong> #{v}<br/>"
    end
    flash[:error] += "<br/>"
  end
  
  def detect_ie
    if request.env["HTTP_USER_AGENT"] =~ /MSIE/ 
      render :layout => false, :template => "../../public/404.html" #"../../public/ie/index.html"
    end
  end
  
end
