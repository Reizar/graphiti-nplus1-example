class CreateTenancyMemberships < ActiveRecord::Migration[7.1]
  def change
    create_table :tenancy_memberships do |t|
      t.references :tenancy, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
