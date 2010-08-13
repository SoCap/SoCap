class HomeController < ApplicationController
  
  def index
  end
  
  def blue
    session[:color] = "blue"
    redirect_to :back
  end
  
  def green
    session[:color] = "green"
    redirect_to :back
  end
  
  def black
    session[:color] = "black"
    redirect_to :back
  end
  
end