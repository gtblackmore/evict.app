class EntitiesController < ApplicationController
  before_action :authentication_required

  def index
    @entities = Entity.all
  end

  def show
    @entity = Entity.find(params[:id])
  end

  def new
    @entity = Entity.new
  end

  def create
    @entity = Entity.new(entity_params)

    if @entity.save
      redirect_to entity_path(@entity)
    else
      render :new
    end    
  end

  def edit
    @entity = Entity.find(params[:id])
  end

  def update
    @entity = Entity.find(params[:id])
    @entity.update(entity_params)

    if @entity.save
      redirect_to entity_path(@entity)
    else
      render :edit
    end
  end

  def destroy
    @entity = Entity.find(params[:id])
    @entity.destroy
    flash[:notice] = "Entity Deleted"
  end

  private

  def entity_params
    params.require(:entity).permit(:legal_name, :address, :city, :state, :zip, :entity_type, :phone, :email, :user_id)
  end

end