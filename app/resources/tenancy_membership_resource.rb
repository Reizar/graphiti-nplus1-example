class TenancyMembershipResource < ApplicationResource
  self.model = TenancyMembership
  self.type = :tenancy_memberships

  attribute :tenancy_id, :integer_id
  attribute :user_id, :integer_id

  belongs_to :tenancy
  belongs_to :user
end
