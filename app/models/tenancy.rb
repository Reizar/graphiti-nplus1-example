class Tenancy < ApplicationRecord
  belongs_to :property

  has_many :tenancy_memberships
  has_many :users, through: :tenancy_memberships

  has_many :inspections
end
