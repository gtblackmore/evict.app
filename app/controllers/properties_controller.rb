class PropertiesController < ApplicationController
  before_action :authentication_required
  
  def index
    @entity = Entity.find(params[:entity_id])
    @properties = @entity.properties
  end

  def show
    @property = Property.find(params[:id])
  end

  def new
    @property = Property.new
    @entities = @current_user.entities
  end

  def create
    @entities = @current_user.entities
    @property = Property.new(property_params)

    if @property.save
      redirect_to property_path(@property)
    else
      render :new
    end
  end

  def edit
    @property = Property.find(params[:id])
    @entities = @current_user.entities
  end

  def update
    @property = Property.find(params[:id])
    @property.update(property_params)
    
    if @property.save
      redirect_to property_path(@property)
    else
      render :edit
    end
  end

  def destroy
    @property = Property.find(params[:id])
    @property.destroy
    flash[:notice] = "Property Deleted"
    redirect_to user_path(@current_user)
  end

  private

  def property_params
    params.require(:property).permit(:address, :city, :state, :zip, :county, :rent, :entity_id)
  end

end
