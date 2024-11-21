class CreateInspections < ActiveRecord::Migration[7.1]
  def change
    create_table :inspections do |t|
      t.references :tenancy, null: false, foreign_key: true

      t.timestamps
    end
  end
end
