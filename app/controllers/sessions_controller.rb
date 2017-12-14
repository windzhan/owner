class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_phone(params[:session][:phone])
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to user_path(user)
    else
      flash.now[:error] = 'Invalid phone/password combination' 
      render :new
    end
  end
  
  def destroy
    sign_out
  end
end