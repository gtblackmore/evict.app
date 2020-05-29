class PropertiesController < ApplicationController
  before_action :authentication_required
  
  def index
    @properties = Property.all
  end

  def show
    @property = Property.find(params[:id])
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    
    if @property.save
      redirect_to property_path(@property)
    else
      render :new
    end
  end

  def edit
    @property = Property.find(params[:id])
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
  end

  private

  def property_params
    params.require(:property).permit(:address, :city, :state, :zip, :county, :rent, :entity_id)
  end

end
