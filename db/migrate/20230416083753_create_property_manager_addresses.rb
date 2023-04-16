class CreatePropertyManagerAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :property_manager_addresses do |t|
      t.references :address, null: false, foreign_key: true
      t.references :property_manager, null: false, foreign_key: true

      t.timestamps
    end
  end
end
