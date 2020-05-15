class TenantsController < ApplicationController

  def index
    @tenants = Tenant.all
  end

  def show
    @tenant = Tenant.find(params[:id])
  end

  def new
    @tenant = Tenant.new
  end

  def create
    @tenant = Tenant.new(tenant_params)

    if @tenant.save
      redirect_to tenant_path(@tenant)
    else
      render :new
    end
  end

  def edit
    @tenant = Tenant.find(params[:id])
  end

  def update
    @tenant = Tenant.find(params[:id])
    @tenant.update(tenant_params)

    if @tenant.save
      redirect_to tenant_path(@tenant)
    else
      render :edit
    end
  end

  def destroy
    @tenant = Tenant.find(params[:id])
    @tenant.destroy
    flash[:notice] = "Tenant Deleted"
  end

  private

  def tenant_params
    params.require(:tenant).permit(:first_name, :last_name, :email, :phone, :past_due, :outstanding_balance, :property_id)
  end

end
