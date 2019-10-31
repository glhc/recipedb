class PagesController < ApplicationController
  def home
    if session[:pantry].nil? 
      session[:pantry] = {}
    end
    @logged_in_user = User.find_by :id => session[:user_id]

    p "Q: does a session cookie exist?"
    p "A: "
    p session[:pantry]
  end

  def results
    
  end

  def about
  end
end
