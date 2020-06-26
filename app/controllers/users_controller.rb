class UsersController < ApplicationController
  before_action :authentication_required, only: [:show, :edit, :update, :destroy] 
  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def show
  
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit

  end

  def update
    @user.update(user_params)

    if @user.save
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    session.delete :user_id
    redirect_to '/'
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

  def find_user
    @user = current_user
  end
end

