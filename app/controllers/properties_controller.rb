class PropertiesController < ApplicationController
  before_action :authentication_required, :find_property, only: [:show, :edit, :update, :destroy]

  
  def index
  end

  def show
  end

  def new
    @property = current_user.properties.build
  end

  def create
    @property = current_user.properties.build(property_params)

    if @property.save
      redirect_to property_path(@property)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @property.update(property_params)
    
    if @property.save
      redirect_to property_path(@property)
    else
      render :edit
    end
  end

  def destroy
    @property.destroy
    redirect_to user_path(@current_user)
  end

  private

  def property_params
    params.require(:property).permit(:address, :city, :state, :zip, :county, :rent, :landlord, :user_id)
  end
  
  def find_property
    @property = Property.find(params[:id])
  end
end
