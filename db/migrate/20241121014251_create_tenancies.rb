class CreateTenancies < ActiveRecord::Migration[7.1]
  def change
    create_table :tenancies do |t|

      t.references :property, null: false, foreign_key: true

      t.timestamps
    end
  end
end
