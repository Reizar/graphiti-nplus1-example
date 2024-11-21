class Inspection < ApplicationRecord
  belongs_to :tenancy

  has_many :inspection_items
end
