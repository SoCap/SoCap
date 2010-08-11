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
    #   
    # session[:conference_params] = {:organizer_id => current_organizer.id}
    # @conference = Conference.new(session[:conference_params])
    # 
    # if session[:conference_step] == "questions" && session[:conference_params][:questions] == nil
    #   question = @conference.questions.build
    #   3.times {question.answers.build}
    #   @conference.current_step = "questions"
    # else
    #   @conference.current_step = session[:conference_step] if session[:conference_step]
    # end
  # end
  
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
    
    # if session[:conference_id]
    #       @conference = Conference.find(session[:conference_id])
    #     else
    #       @conference = Conference.new(:organizer_id => current_organizer.id)
    #     end
    #     
    #     @conference.current_step = session[:conference_step]
    #     if params[:conference][:start_date]
    #       params[:conference][:start_date] = format_date_string(params[:conference][:start_date])
    #       params[:conference][:end_date] = format_date_string(params[:conference][:end_date])
    #     end
    #     if @conference.current_step == "attendee"
    #       conference = true
    #       params[:conference][:attendees_attributes].each do |a, i|
    #         if attendee = Attendee.where("email = ?", i['email']).first
    #           if !@conference.attendees.include?(attendee)
    #             @conference.attendees << attendee
    #           end
    #         else
    #           if !i['email'].blank?
    #             attendee = Attendee.create(:email => i['email'], :password => "temporary")
    #             begin
    #               @conference.attendees << attendee
    #             rescue
    #               flash[:error] = "<strong>#{i['email']}</strong> is not a valid email address"
    #               session[:conference_step] = "attendees"
    #               @conference.current_step = "attendees"
    #               render "new"
    #               return
    #             end
    #           end
    #         end
    #       end
    #     else
    #       conference = @conference.update_attributes(params[:conference])
    #     end
    #     
    #     if conference
    #       if @conference.questions.count == 0
    #         question = @conference.questions.build
    #         3.times {question.answers.build}
    #       end
    #       if @conference.attendees.count == 0
    #         attendee = @conference.attendees.build
    #         attendee.build_temporary_profile
    #       end
    #       
    #       session[:conference_id] = @conference.id
    #       if @conference.last_step?
    #         session[:conference_step] = session[:conference_id] = nil
    #         flash[:success] = "Your Conference has been created"
    #         redirect_to organizer_conferences_path  
    #       else
    #         flash[:success] = "Your conference <strong>details</strong> were successfully created" if session[:conference_step] == "details"
    #         flash[:success] = "You created <strong>#{@conference.questions.count}</strong> questions for this conference" if session[:conference_step] == "questions"
    #         flash[:success] = "You have registered <strong>#{@conference.attendees.count}</strong> attendees for this conference" if session[:conference_step] == "attendees"
    #         @conference.next_step
    #         session[:conference_step] = @conference.current_step
    #         render "new"
    #       end
    #     else
    #       render "new"
    #     end
    # end
  
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
  
  def format_date_string(string)
    date = string.split("/")
    formatted = "#{date[2]}/#{date[0]}/#{date[1]}"
    return formatted
  end
    
end