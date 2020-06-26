class AttorneysController < ApplicationController
  before_action :authentication_required, :find_attorney, only: [:show, :edit, :update, :destroy]

  def show
 
  end 

  def new
    @attorney = Attorney.new
  end

  def create
    @attorney = Attorney.new(attorney_params)
   
    if @attorney.save
      redirect_to attorney_path(@attorney)
    else
      render :new
    end
  end

  def edit
  
  end

  def update
    @attorney.update(attorney_params)
    
    if @attorney.save
      redirect_to attorney_path(@attorney)
    else
      render :edit
    end
  end

  def destroy
    @attorney.destroy
    redirect_to user_path(@current_user)
  end

  

  private 

  def attorney_params
    params.require(:attorney).permit(:first_name, :last_name, :firm, :email, :phone, :fee)
  end

  def find_attorney
    @attorney = Attorney.find(params[:id])
  end
end