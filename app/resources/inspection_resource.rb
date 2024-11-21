class InspectionResource < ApplicationResource
  self.model = Inspection
  self.type = :inspections

  attribute :tenancy_id, :integer_id

  belongs_to :tenancy
  has_many :inspection_items
end
