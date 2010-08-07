module ApplicationHelper
  
  def current_user
    if !current_attendee.blank?
      return current_attendee
    elsif !current_organizer.blank?
      return current_organizer
    else
      return nil
    end
  end
  
  def current_user_class
    user = current_user
    user != nil ? user.class : nil
  end
  
end
