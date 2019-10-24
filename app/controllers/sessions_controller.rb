class SessionsController < ApplicationController
  def new
    @error_message = flash[:error]
  end

  def create
    user = User.find_by :email => params[:email]
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id # store their id in user's session hash
      redirect_to root_path
    else
      flash[:error] = 'Invalid Credentials'
      redirect_to '/login'
    end
  end

  def destroy
  end
end
