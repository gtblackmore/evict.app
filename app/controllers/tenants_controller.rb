class TenantsController < ApplicationController
  before_action :authentication_required, :find_tenant, only: [:show, :edit, :update, :destroy]
  before_action :find_property, only: [:new, :create, :edit, :update]
 

  def index
    @tenants = current_user.tenants
  end

  def show
  end

  def new
    @tenant = current_user.tenants.build
      
  end

  def create
   
    @tenant = current_user.tenants.build(tenant_params)
    
    if @tenant.save
      redirect_to property_tenant_path(@property, @tenant)
    else
      render :new
    end
  end

  def edit
  end

  def update
    
    @tenant.update(tenant_params)
    
    if @tenant.save
      redirect_to property_tenant_path(@tenant)
    else
      render :edit
    end
  end

  def destroy
    @tenant.destroy
    flash[:notice] = "Tenant Deleted"
    redirect_to user_path(@current_user)
  end

  private

  def tenant_params
    params.require(:tenant).permit(:first_name, :last_name, :email, :phone, :past_due, :outstanding_balance, :property_id, :user_id)
  end
  
  def find_tenant
    @tenant = Tenant.find(params[:id])
  end

  def find_property
    @property = Property.find(params[:property_id])
  end
end
