class TenancyMembership < ApplicationRecord
  belongs_to :tenancy
  belongs_to :user
end
