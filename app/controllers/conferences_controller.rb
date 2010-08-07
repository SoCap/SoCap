class ConferencesController < ApplicationController
  
  def index
  
  end
  
  def new
    @conference = Conference.new
  end
  
  def create
    #get the from and to dates
    range = params[:date_range].split(" - ")    
    params[:conference][:start_date] = Date.strptime(params[:conference][:start_date], "%m/%d/%Y")
    params[:conference][:end_date] = Date.strptime(params[:conference][:end_date], "%m/%d/%Y")
    to = Date.strptime(range[1], "%m/%d/%Y")

    if from > to
      #check the dates are valid
      flash[:error] = "The event start date must be earlier than the end date"
      render 'new'
      return
    end
    
    conference = Conference.new(params[:conference])
    conference.update_attributes({:start_date => from, :end_date => to, :organizer_id => current_organizer.id})
    conference.save
    
    if conference
      redirect_to organizer_conferences_path
    else
      render 'new'
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
    
  end
  
end