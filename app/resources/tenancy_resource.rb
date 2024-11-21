class TenancyResource < ApplicationResource
  self.model = Tenancy
  self.type = :tenancies

  attribute :property_id, :integer_id
  
  belongs_to :property

  has_many :tenancy_memberships
end
