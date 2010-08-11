class ConferenceAttendeesController < ApplicationController
  def new
    @conference = Conference.find(params[:id])
    @conference.attendees.build
  end
  
  def create
    @conference = Conference.find(params[:conference][:id])
    
    space = ""
    13.times {space += "&nbsp;"}
    errors = false
    params[:conference][:attendees_attributes].each do |a, i|
      if attendee = Attendee.where("email = ?", i['email']).first
        if !@conference.attendees.include?(attendee)
          @conference.attendees << attendee
        end
      else
        if !i['email'].blank?
          attendee = Attendee.create(:email => i['email'], :password => "temporary")
          begin
            @conference.attendees << attendee
          rescue
            if errors
              flash[:error] += "#{space}<strong>#{i['email']}</strong> is not a valid email address<br/>"
            else
              flash[:error] = "<p>There were the following errors with your submission</p>"
              flash[:error] += "#{space}<strong>#{i['email']}</strong> is not a valid email address<br/>"
              errors = true 
            end            
          end
        end
      end      
    end
    
    if errors
      flash[:error] += "<br/>"
      render "new"
    else
      flash[:error] = nil
      flash[:success] = "<strong>#{@conference.attendees.count}</strong> attendees were registered for this conference"
      render "confirmation"
    end
  end
  
  def edit
    @conference = Conference.find(params[:id])
  end
  
  def update
    @conference = Conference.find(params[:conference][:id])
    
    space = ""
    13.times {space += "&nbsp;"}
    errors = false
    params[:conference][:attendees_attributes].each do |a, i|
      if attendee = Attendee.where("email = ?", i['email']).first
        if !@conference.attendees.include?(attendee)
          @conference.attendees << attendee
        elsif i['_destroy'] == '1'
          @conference.attendees.delete(attendee)
        end
      else
        if !i['email'].blank?
          attendee = Attendee.create(:email => i['email'], :password => "temporary")
          begin
            if i['_destroy'] == "false"
              @conference.attendees << attendee
            end
          rescue
            if errors
              flash[:error] += "#{space}<strong>#{i['email']}</strong> is not a valid email address<br/>"
            else
              flash[:error] = "<p>There were the following errors with your submission</p>"
              flash[:error] += "#{space}<strong>#{i['email']}</strong> is not a valid email address<br/>"
              errors = true 
            end            
          end
        end
      end      
    end
    
    if errors
      flash[:error] += "<br/>"
      render "edit"
    else
      flash[:error] = nil
      flash[:success] = "<strong>#{@conference.attendees.count}</strong> attendees were registered for this conference"
      render "edit"
    end
  end
  
end