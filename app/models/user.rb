class User < ApplicationRecord
  has_many :tenancy_memberships
  has_many :tenancies, through: :tenancy_memberships
end
