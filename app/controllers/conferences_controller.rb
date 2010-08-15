class ConferencesController < ApplicationController

  def index
    
  end
  
  def show
    @conference = Conference.find(params[:id])
  end
  
  def questions
    @questions = Conference.find(params[:id]).questions
  end
  
  def attendees
    @attendees = Conference.find(params[:id]).attendees
  end
  
  def new
    @conference = Conference.new
  end
  
  def create
    params[:conference][:start_date] = format_date_string(params[:conference][:start_date])
    params[:conference][:end_date] = format_date_string(params[:conference][:end_date])
    @conference = Conference.new(params[:conference])
    @conference.update_attribute(:organizer_id, current_organizer.id)
    conference = @conference.save
    
    if conference
      flash[:success] = "<strong>#{@conference.title}</strong> was created"
      redirect_to new_question_path(@conference.id)
    else
      flash[:error] = "There were problems with your submission"
      render "new"
    end
  end
  
  def edit
    @conference = Conference.find(params[:id])
    if current_organizer.id != @conference.organizer_id
      flash[:error] = "You do not have acces to this page"
      redirect_to root_path
    end
  end
  
  def update
    params[:conference][:start_date] = format_date_string(params[:conference][:start_date])
    params[:conference][:end_date] = format_date_string(params[:conference][:end_date])
    id = params[:conference][:id]
    @conference = Conference.find(id)
    params[:conference].delete('id')
    
    if @conference.update_attributes(params[:conference])
      flash[:success] = "<strong>#{@conference.title}</strong> was updated"
      redirect_to edit_conference_path(@conference.id)
    else
      flash[:error] = "There were problems with your submission"
      @errors = @conference.errors
      render "edit"
    end
  end
  
  def destroy
    @conference = Conference.find(params[:id])
    
    if current_organizer.id != @conference.organizer_id
      flash[:error] = "You do not have acces to this page"
      redirect_to root_path
    else
      flash[:success] = 'Conference "#{@conference.title}" successfully deleted'
      @conference.destroy
      redirect_to organizer_conferences_path
    end      
  end
  
  def match
    @conference = Conference.find(params[:id])
    @questions = @conference.questions
  end
  
  def matches
    @conference = Conference.find(params[:id])
    @matches = MatchedConferenceAttendee.where("conference_id = ? AND attendee_id = ? AND matched > ?", params[:id], current_attendee.id, 50)
  end
  
  def matches_show
    @conference = Conference.find(params[:conference])
    @matches = MatchedConferenceAttendee.where("conference_id = ? AND attendee_id = ? AND matched > ?", @conference.id, current_attendee.id, 50)
    render 'matches'
  end
  
  def matches_select
    @conferences = current_attendee.conferences
  end
  
  def make_matches
    response = ""
    params[:conference][:questions_attributes].each do |k, v|
      v['weight'].to_i.times do
        response += v['answers']
      end
    end
    p "################################################"
    p response
    response = ConferenceAttendeeResponse.new(:attendee_id => current_attendee.id, :conference_id => params[:conference][:id], :response => response)
    response.save
    matches = response.match
    redirect_to conference_matches_path(params[:conference][:id])
  end
  
  def format_date_string(string)
    date = string.split("/")
    formatted = "#{date[2]}/#{date[0]}/#{date[1]}"
    return formatted
  end
    
end