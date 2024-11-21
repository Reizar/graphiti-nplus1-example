class TenancyMembershipsController < ApplicationController
  def index
    tenancy_memberships = TenancyMembershipResource.all(params)
    respond_with(tenancy_memberships)
  end

  def show
    tenancy_membership = TenancyMembershipResource.find(params)
    respond_with(tenancy_membership)
  end

  def create
    tenancy_membership = TenancyMembershipResource.build(params)

    if tenancy_membership.save
      render jsonapi: tenancy_membership, status: 201
    else
      render jsonapi_errors: tenancy_membership
    end
  end

  def update
    tenancy_membership = TenancyMembershipResource.find(params)

    if tenancy_membership.update_attributes
      render jsonapi: tenancy_membership
    else
      render jsonapi_errors: tenancy_membership
    end
  end

  def destroy
    tenancy_membership = TenancyMembershipResource.find(params)

    if tenancy_membership.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: tenancy_membership
    end
  end
end
