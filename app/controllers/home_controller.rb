class HomeController < ApplicationController
  skip_before_action :set_current_business, only: [:index]

  def index
    return unless logged_in?

    # If user is an organization owner, show organization landing page
    if current_employee.organization_owner?
      @organization = current_employee.owned_organization
      @businesses = @organization.businesses.includes(:employees, :locations)
      render :organization_landing
    else
      # Regular business employee sees their primary business dashboard
      @business = current_employee.primary_business
      @business_role = current_employee.emp_role(@business)
    end
  end
end
