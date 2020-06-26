class EvictionsController < ApplicationController
  before_action :authentication_required, :find_eviction, only: [:show, :edit, :update, :destroy]

  def index
    @evictions = Eviction.all
  end

  def show
 
  end 

  def new
    @eviction = Eviction.new

  end

  def create
    @eviction = Eviction.new(eviction_params)
   
    if @eviction.save
      redirect_to eviction_path(@eviction)
    else
      render :new
    end
  end

  def edit
  
  end

  def update
    @eviction.update(eviction_params)
    
    if @eviction.save
      redirect_to eviction_path(@eviction)
    else
      render :edit
    end
  end

  def destroy
    @tenant.destroy
    redirect_to user_path(@current_user)
  end

  

  private 

  def eviction_params
    params.require(:eviction).permit(:property_id, :attorney_id, :outstanding_balance, :notice_date)
  end

  def find_eviction
    @eviction = Eviction.find(params[:id])
  end
end