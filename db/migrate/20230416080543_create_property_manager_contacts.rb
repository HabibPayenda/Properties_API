class CreatePropertyManagerContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :property_manager_contacts do |t|
      t.references :contact, null: false, foreign_key: true
      t.references :property_manager, null: false, foreign_key: true

      t.timestamps
    end
  end
end
