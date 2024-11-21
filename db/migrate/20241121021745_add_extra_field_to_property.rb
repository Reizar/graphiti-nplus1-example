class AddExtraFieldToProperty < ActiveRecord::Migration[7.1]
  def change
    add_column :properties, :agency_id, :integer, null: true

    Property.update_all(agency_id: 1)
  end
end
