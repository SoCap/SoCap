class QuestionsController < ApplicationController
  
  def new
    @conference = Conference.find(params[:id])
    question = @conference.questions.build
    question.answers.build
  end
  
  def create
    @conference = Conference.find(params[:conference][:id])
    conference = @conference.update_attributes(params[:conference])
    
    if conference != false
      flash[:success] = "<strong>#{@conference.questions.count}</strong> questions created for your conference"
      redirect_to new_conference_attendees_path(@conference.id)
    else
      render "new"
    end
  end
  
  def edit
    @conference = Conference.find(params[:id])
  end
  
  def update
    @conference = Conference.find(params[:conference][:id])
    params[:conference].delete('id')
    conference = @conference.update_attributes(params[:conference])
    
    if conference != false
      flash[:success] = "<strong>Questions</strong> successfully updated"
      redirect_to edit_conference_questions_path(@conference.id)
    else
      render "edit"
    end
  end
  
  def destroy
    
  end
  
end