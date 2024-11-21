class TenanciesController < ApplicationController
  def index
    tenancies = TenancyResource.all(params)
    respond_with(tenancies)
  end

  def show
    tenancy = TenancyResource.find(params)
    respond_with(tenancy)
  end

  def create
    tenancy = TenancyResource.build(params)

    if tenancy.save
      render jsonapi: tenancy, status: 201
    else
      render jsonapi_errors: tenancy
    end
  end

  def update
    tenancy = TenancyResource.find(params)

    if tenancy.update_attributes
      render jsonapi: tenancy
    else
      render jsonapi_errors: tenancy
    end
  end

  def destroy
    tenancy = TenancyResource.find(params)

    if tenancy.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: tenancy
    end
  end
end
