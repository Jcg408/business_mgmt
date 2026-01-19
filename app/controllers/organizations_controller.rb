class OrganizationsController < ApplicationController
  skip_before_action :set_current_business
  before_action :set_organization, only: [:show, :edit, :update, :destroy]
  before_action :require_organization_owner, only: [:edit, :update, :destroy]

  def index
    @organizations = Organization.all
  end

  def show
    @businesses = @organization.businesses.includes(:locations, :phones)
    @employees = @organization.employees.includes(:business_employees, :businesses)
  end

  def new
    @organization = Organization.new
    @employees = Employee.where(organization_id: nil) # Employees not yet assigned to an organization
  end

  def create
    @organization = Organization.new(organization_params)

    if @organization.save
      redirect_to organization_path(@organization), notice: "Organization created successfully"
    else
      @employees = Employee.where(organization_id: nil)
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @employees = @organization.employees
  end

  def update
    if @organization.update(organization_params)
      redirect_to organization_path(@organization), notice: "Organization updated successfully."
    else
      @employees = @organization.employees
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @organization.destroy
    redirect_to organizations_path, notice: "Organization deleted successfully."
  end

  private

  def set_organization
    @organization = Organization.find(params[:id])
  end

  def organization_params
    params.require(:organization).permit(:name, :description, :active, :owner_id)
  end
end
