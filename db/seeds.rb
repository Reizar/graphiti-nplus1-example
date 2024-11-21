# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


ActiveRecord::Base.transaction do
  1000.times do |x|
    p = Property.create!(address: "Address: #{x}", agency_id: 1)
    t = Tenancy.create!(property: p)
    Inspection.create!(tenancy: t)

    u1 = User.create!
    u2 = User.create!

    TenancyMembership.create!(tenancy: t, user: u1)
    TenancyMembership.create!(tenancy: t, user: u2)
  end
end