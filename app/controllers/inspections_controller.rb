class InspectionsController < ApplicationController

  self.sideload_allowlist = {
    index: {tenancy: {tenancy_memberships: :user, property: []}}
  }

  def index
    inspections = InspectionResource.all(params, base_scope)
    respond_with(inspections)
  end

  def show
    inspection = InspectionResource.find(params)
    respond_with(inspection)
  end

  def create
    inspection = InspectionResource.build(params)

    if inspection.save
      render jsonapi: inspection, status: 201
    else
      render jsonapi_errors: inspection
    end
  end

  def update
    inspection = InspectionResource.find(params)

    if inspection.update_attributes
      render jsonapi: inspection
    else
      render jsonapi_errors: inspection
    end
  end

  def destroy
    inspection = InspectionResource.find(params)

    if inspection.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: inspection
    end
  end

  def base_scope 
    Inspection.joins(tenancy: :property).where(properties: {agency_id: 1})
  end
end
