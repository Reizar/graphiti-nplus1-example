class PropertyResource < ApplicationResource
  self.model = Property
  self.type = :properties 

  attribute :address, :string 

  has_many :tenancies
end
