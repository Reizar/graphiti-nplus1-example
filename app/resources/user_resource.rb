class UserResource < ApplicationResource
  self.model = User
  self.type = :users

  has_many :tenancy_memberships
end
