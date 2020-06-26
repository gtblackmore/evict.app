class SessionsController < ApplicationController
  def new
  end

  def create
    if request.env["omniauth.auth"] != nil
      auth = request.env["omniauth.auth"]["info"]  
      user = User.find_or_create_by_omniauth(auth)
      session[:user_id] = user.id

      redirect_to home_path
    elsif
      if user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
          session[:user_id] = user.id
          redirect_to user_path(user)
        else
          render :new
        end
      end
    else
      flash.alert = "Invalid email or password"
      render :new
    end
  end

  def destroy
    session.delete :user_id
    redirect_to "/login"
  end

end